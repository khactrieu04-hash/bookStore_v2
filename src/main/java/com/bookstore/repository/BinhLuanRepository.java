// BinhLuanRepository.java
package com.bookstore.repository;

import com.bookstore.entity.BinhLuanEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface BinhLuanRepository extends JpaRepository<BinhLuanEntity, Long> {
    Optional<BinhLuanEntity> findByMaBL(String maBL);
    boolean existsByMaBL(String maBL);
}
