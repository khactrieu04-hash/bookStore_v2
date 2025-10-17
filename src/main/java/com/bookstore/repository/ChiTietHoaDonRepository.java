package com.bookstore.repository;

import com.bookstore.entity.ChiTietHoaDonEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ChiTietHoaDonRepository extends JpaRepository<ChiTietHoaDonEntity, Long> {
    Optional<ChiTietHoaDonEntity> findByMaCTHD(String maCTHD);
    boolean existsByMaCTHD(String maCTHD);
}
