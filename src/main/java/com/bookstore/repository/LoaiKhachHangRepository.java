// LoaiKhachHangRepository.java
package com.bookstore.repository;

import com.bookstore.entity.LoaiKhachHangEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface LoaiKhachHangRepository extends JpaRepository<LoaiKhachHangEntity, Long> {
    Optional<LoaiKhachHangEntity> findByMaLKH(String maLKH);
    boolean existsByMaLKH(String maLKH);
}
