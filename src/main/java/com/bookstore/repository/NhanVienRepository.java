// NhanVienRepository.java
package com.bookstore.repository;

import com.bookstore.entity.NhanVienEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface NhanVienRepository extends JpaRepository<NhanVienEntity, Long> {
    Optional<NhanVienEntity> findByMaNV(String maNV);
    boolean existsByMaNV(String maNV);
}
