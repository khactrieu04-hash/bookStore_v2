// KhoRepository.java
package com.bookstore.repository;

import com.bookstore.entity.KhoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface KhoRepository extends JpaRepository<KhoEntity, Long> {
    Optional<KhoEntity> findByMaKho(String maKho);
    boolean existsByMaKho(String maKho);
}
