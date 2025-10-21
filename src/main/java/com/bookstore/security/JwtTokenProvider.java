package com.bookstore.security;

import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.DecodingException;
import io.jsonwebtoken.security.Keys;

import jakarta.annotation.PostConstruct;

@Component
public class JwtTokenProvider {

    @Value("${app.jwt.secret}")
    private String jwtSecret; // có thể là raw string, Base64 hoặc Base64URL

    @Value("${app.jwt.expiration:900000}") // 15 phút mặc định
    private long expirationMs;

    @Value("${app.jwt.refreshExpiration:1209600000}") // 14 ngày mặc định
    private long refreshExpirationMs;

    @Value("${app.jwt.issuer:bookstore-api}")
    private String issuer;

    private Key key;

    @PostConstruct
    public void init() {
        // Trim để tránh lỗi do khoảng trắng / ký tự thừa cuối dòng
        String s = jwtSecret == null ? "" : jwtSecret.trim();

        byte[] keyBytes = null;

        // 1) Thử Base64 chuẩn
        try {
            keyBytes = java.util.Base64.getDecoder().decode(s);
        } catch (IllegalArgumentException e1) {
            // 2) Thử Base64URL (hỗ trợ '-' và '_')
            try {
                keyBytes = java.util.Base64.getUrlDecoder().decode(s);
            } catch (IllegalArgumentException e2) {
                // 3) Fallback: dùng raw bytes (yêu cầu độ dài >= 32 để HMAC-SHA)
                keyBytes = s.getBytes(StandardCharsets.UTF_8);
            }
        }

        // Nếu độ dài chưa đủ, tự "kéo" lên tối thiểu 32 bytes để Keys.hmacShaKeyFor không lỗi
        if (keyBytes.length < 32) {
            byte[] padded = new byte[32];
            System.arraycopy(keyBytes, 0, padded, 0, Math.min(keyBytes.length, 32));
            // nếu thiếu thì lặp lại cho đủ
            for (int i = keyBytes.length, j = 0; i < 32; i++, j++) {
                padded[i] = keyBytes[j % keyBytes.length];
            }
            keyBytes = padded;
        }

        this.key = Keys.hmacShaKeyFor(keyBytes);
    }

    public String generateAccessToken(String username) {
        Date now = new Date();
        Date exp = new Date(now.getTime() + expirationMs);
        return Jwts.builder()
                .setSubject(username)
                .setIssuer(issuer)
                .setIssuedAt(now)
                .setExpiration(exp)
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }

    public String generateRefreshToken(String username) {
        Date now = new Date();
        Date exp = new Date(now.getTime() + refreshExpirationMs);
        return Jwts.builder()
                .setSubject(username)
                .setIssuer(issuer)
                .setIssuedAt(now)
                .setExpiration(exp)
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }

    public boolean validateToken(String token) {
        try {
            getAllClaims(token);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public String getUsername(String token) {
        return getAllClaims(token).getSubject();
    }

    private Claims getAllClaims(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(key)
                .build()
                .parseClaimsJws(token)
                .getBody();
    }
}
