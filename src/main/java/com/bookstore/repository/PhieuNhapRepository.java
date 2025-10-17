// PhieuNhapRepository.java
package com.bookstore.repository;

import com.bookstore.entity.PhieuNhapEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PhieuNhapRepository extends JpaRepository<PhieuNhapEntity, Long> {
    Optional<PhieuNhapEntity> findByMaPN(String maPN);
    boolean existsByMaPN(String maPN);
}
