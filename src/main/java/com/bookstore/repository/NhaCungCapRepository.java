// NhaCungCapRepository.java
package com.bookstore.repository;

import com.bookstore.entity.NhaCungCapEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface NhaCungCapRepository extends JpaRepository<NhaCungCapEntity, Long> {
    Optional<NhaCungCapEntity> findByMaNCC(String maNCC);
    boolean existsByMaNCC(String maNCC);
}
