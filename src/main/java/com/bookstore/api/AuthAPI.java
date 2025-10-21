package com.bookstore.api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bookstore.dto.LoginRequest;
import com.bookstore.entity.TaiKhoanEntity;
import com.bookstore.entity.VaiTroEntity;
import com.bookstore.repository.TaiKhoanRepository;
import com.bookstore.repository.VaiTroRepository;
import com.bookstore.security.JwtTokenProvider;

@RestController
@RequestMapping("/api/auth")
public class AuthAPI {

    private final TaiKhoanRepository taiKhoanRepository;
    private final VaiTroRepository vaiTroRepository;
    private final PasswordEncoder encoder;
    private final JwtTokenProvider tokenProvider;

    public AuthAPI(TaiKhoanRepository taiKhoanRepository,
                   VaiTroRepository vaiTroRepository,
                   PasswordEncoder encoder,
                   JwtTokenProvider tokenProvider) {
        this.taiKhoanRepository = taiKhoanRepository;
        this.vaiTroRepository = vaiTroRepository;
        this.encoder = encoder;
        this.tokenProvider = tokenProvider;
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest req) {
        TaiKhoanEntity user = taiKhoanRepository.findByTenDangNhap(req.getUsername()).orElse(null);
        if (user == null || !encoder.matches(req.getPassword(), user.getMatKhau())) {
            return ResponseEntity.status(401).body(Map.of("error", "Sai tài khoản/mật khẩu"));
        }

        String role = (user.getVaiTro() != null && user.getVaiTro().getMaVT() != null)
                ? user.getVaiTro().getMaVT()
                : "KHACH_HANG";

        // đưa role vào claims của access token
        Map<String, Object> claims = Map.of("role", role);
        String accessToken = tokenProvider.generateAccessToken(user.getTenDangNhap());
        String refreshToken = tokenProvider.generateRefreshToken(user.getTenDangNhap());

        Map<String, Object> resp = new HashMap<>();
        resp.put("accessToken", accessToken);
        resp.put("refreshToken", refreshToken);
        resp.put("role", role);
        resp.put("username", user.getTenDangNhap());
        return ResponseEntity.ok(resp);
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody Map<String, String> req) {
        String username = req.getOrDefault("tenDangNhap", "").trim();
        String password = req.getOrDefault("matKhau", "").trim();
        if (username.isBlank() || password.isBlank()) {
            return ResponseEntity.badRequest().body(Map.of("error", "Thiếu tên đăng nhập/mật khẩu"));
        }
        if (taiKhoanRepository.existsByTenDangNhap(username)) {
            return ResponseEntity.badRequest().body(Map.of("error", "Tên đăng nhập đã tồn tại"));
        }

        TaiKhoanEntity user = new TaiKhoanEntity();
        user.setTenDangNhap(username);
        user.setMatKhau(encoder.encode(password));
        user.setTrangThai(true);
        user.setMaTK(java.util.UUID.randomUUID().toString());

        // Gán mặc định KHÁCH_HÀNG
        VaiTroEntity role = vaiTroRepository.findByMaVT("KHACH_HANG").orElse(null);
        user.setVaiTro(role);

        taiKhoanRepository.save(user);
        return ResponseEntity.ok(Map.of("message", "Đăng ký thành công"));
    }

    // Endpoint đổi refresh token lấy access token mới (tùy bạn dùng)
    @PostMapping("/refresh")
    public ResponseEntity<?> refresh(@RequestBody Map<String,String> body) {
        String refreshToken = body.get("refreshToken");
        if (refreshToken == null || !tokenProvider.validateToken(refreshToken)) {
            return ResponseEntity.status(401).body(Map.of("error", "Refresh token không hợp lệ"));
        }
        String username = tokenProvider.getUsername(refreshToken);
        TaiKhoanEntity user = taiKhoanRepository.findByTenDangNhap(username).orElse(null);
        if (user == null) {
            return ResponseEntity.status(401).body(Map.of("error", "Tài khoản không tồn tại"));
        }
        String role = (user.getVaiTro() != null && user.getVaiTro().getMaVT() != null)
                ? user.getVaiTro().getMaVT()
                : "KHACH_HANG";
        String newAccess = tokenProvider.generateAccessToken(username);
        return ResponseEntity.ok(Map.of("accessToken", newAccess));
    }
}
