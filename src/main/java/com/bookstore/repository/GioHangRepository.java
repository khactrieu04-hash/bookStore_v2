// GioHangRepository.java
package com.bookstore.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstore.entity.GioHangEntity;

public interface GioHangRepository extends JpaRepository<GioHangEntity, Long> {
    // Bảng này không có mã riêng ⇒ thường query theo KH & SP nếu cần:
    List<GioHangEntity> findByKhachHang_MaKH(String maKH);
    Optional<GioHangEntity> findByKhachHang_MaKHAndSanPham_MaSP(String maKH, String maSP);
}
