// VaiTroRepository.java
package com.bookstore.repository;

import com.bookstore.entity.VaiTroEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface VaiTroRepository extends JpaRepository<VaiTroEntity, Long> {
    Optional<VaiTroEntity> findByMaVT(String maVT);
    boolean existsByMaVT(String maVT);
}
