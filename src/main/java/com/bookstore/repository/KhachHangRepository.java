// KhachHangRepository.java
package com.bookstore.repository;

import com.bookstore.entity.KhachHangEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface KhachHangRepository extends JpaRepository<KhachHangEntity, Long> {
    Optional<KhachHangEntity> findByMaKH(String maKH);
    boolean existsByMaKH(String maKH);
}
