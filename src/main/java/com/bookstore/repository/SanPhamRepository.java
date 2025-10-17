package com.bookstore.repository;

import com.bookstore.entity.SanPhamEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

//SanPhamRepository.java
public interface SanPhamRepository extends JpaRepository<SanPhamEntity, Long> {
 Optional<SanPhamEntity> findByMaSP(String maSP);

 // dùng cho /by-category/{maLSP}
 List<SanPhamEntity> findAllByLoaiSanPham_MaLSP(String maLSP);

 // dùng cho /search?q=
 List<SanPhamEntity> findByTenSPContainingIgnoreCase(String q);
}

