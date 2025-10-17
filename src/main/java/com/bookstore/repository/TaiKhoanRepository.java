// TaiKhoanRepository.java
package com.bookstore.repository;

import com.bookstore.entity.TaiKhoanEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TaiKhoanRepository extends JpaRepository<TaiKhoanEntity, Long> {
    Optional<TaiKhoanEntity> findByMaTK(String maTK);
    Optional<TaiKhoanEntity> findByTenDangNhap(String tenDangNhap);
    boolean existsByMaTK(String maTK);
    boolean existsByTenDangNhap(String tenDangNhap);
}
