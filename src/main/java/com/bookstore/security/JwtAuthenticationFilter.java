package com.bookstore.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.util.AntPathMatcher;

import java.io.IOException;
import java.util.List;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final JwtTokenProvider jwtTokenProvider;
    private static final AntPathMatcher PATH = new AntPathMatcher();

    // Các URL cho phép truy cập công khai (không cần JWT)
    private static final List<String> PUBLIC = List.of(
            "/actuator/**",
            "/api/auth/**",
            "/v3/api-docs/**", "/swagger-ui/**", "/swagger-ui.html",
            "/images/**", "/static/**",
            "/api/products/**"          // cho GET sản phẩm
    );

    public JwtAuthenticationFilter(JwtTokenProvider jwtTokenProvider) {
        this.jwtTokenProvider = jwtTokenProvider;
    }

    // BỎ QUA filter cho các đường public và preflight
    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) return true;
        String uri = request.getRequestURI();
        for (String p : PUBLIC) {
            if (PATH.match(p, uri)) return true;
        }
        return false;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {

        String header = request.getHeader("Authorization");

        // Nếu không có Bearer token thì CHO QUA, không tự trả 403
        if (header == null || !header.startsWith("Bearer ")) {
            filterChain.doFilter(request, response);
            return;
        }

        String token = header.substring(7);
        try {
            if (jwtTokenProvider.validateToken(token)) {
                String username = jwtTokenProvider.getUsername(token);

                var auth = new UsernamePasswordAuthenticationToken(
                        username, null, java.util.Collections.emptyList());
                auth.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

                SecurityContextHolder.getContext().setAuthentication(auth);
            }
        } catch (Exception ex) {
            // Token lỗi -> không set auth; để chuỗi filter quyết định (route bảo vệ sẽ trả 401/403)
            SecurityContextHolder.clearContext();
        }

        filterChain.doFilter(request, response);
    }
}
