// YeuThichRepository.java
package com.bookstore.repository;

import com.bookstore.entity.YeuThichEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface YeuThichRepository extends JpaRepository<YeuThichEntity, Long> {
    // Tương tự, thường query theo KH & SP:
    boolean existsByKhachHang_MaKHAndSanPham_MaSP(String maKH, String maSP);
}
