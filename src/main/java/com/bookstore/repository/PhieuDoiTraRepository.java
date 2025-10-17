// PhieuDoiTraRepository.java
package com.bookstore.repository;

import com.bookstore.entity.PhieuDoiTraEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PhieuDoiTraRepository extends JpaRepository<PhieuDoiTraEntity, Long> {
    Optional<PhieuDoiTraEntity> findByMaPDT(String maPDT);
    boolean existsByMaPDT(String maPDT);
}
