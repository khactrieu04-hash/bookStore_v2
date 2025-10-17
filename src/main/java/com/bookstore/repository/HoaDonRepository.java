// HoaDonRepository.java
package com.bookstore.repository;

import com.bookstore.entity.HoaDonEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface HoaDonRepository extends JpaRepository<HoaDonEntity, Long> {
    Optional<HoaDonEntity> findByMaHD(String maHD);
    boolean existsByMaHD(String maHD);
}
