// KhuyenMaiRepository.java
package com.bookstore.repository;

import com.bookstore.entity.KhuyenMaiEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface KhuyenMaiRepository extends JpaRepository<KhuyenMaiEntity, Long> {
    Optional<KhuyenMaiEntity> findByMaKM(String maKM);
    boolean existsByMaKM(String maKM);
}
