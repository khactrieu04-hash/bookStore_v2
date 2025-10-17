// LoaiSanPhamRepository.java
package com.bookstore.repository;

import com.bookstore.entity.LoaiSanPhamEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface LoaiSanPhamRepository extends JpaRepository<LoaiSanPhamEntity, Long> {
    Optional<LoaiSanPhamEntity> findByMaLSP(String maLSP);
    Optional<LoaiSanPhamEntity> findByTenLoaiIgnoreCase(String ten);
}
