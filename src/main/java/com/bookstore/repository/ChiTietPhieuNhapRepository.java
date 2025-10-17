// ChiTietPhieuNhapRepository.java
package com.bookstore.repository;

import com.bookstore.entity.ChiTietPhieuNhapEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ChiTietPhieuNhapRepository extends JpaRepository<ChiTietPhieuNhapEntity, Long> {
    Optional<ChiTietPhieuNhapEntity> findByMaCTPN(String maCTPN);
    boolean existsByMaCTPN(String maCTPN);
}
