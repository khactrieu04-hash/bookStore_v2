// LoaiKhuyenMaiRepository.java
package com.bookstore.repository;

import com.bookstore.entity.LoaiKhuyenMaiEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface LoaiKhuyenMaiRepository extends JpaRepository<LoaiKhuyenMaiEntity, Long> {
    Optional<LoaiKhuyenMaiEntity> findByMaLKM(String maLKM);
    boolean existsByMaLKM(String maLKM);
}
