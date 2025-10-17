package com.bookstore.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookstore.entity.LichSuGiaEntity;

public interface LichSuGiaRepository extends JpaRepository<LichSuGiaEntity, Long> {
    Optional<LichSuGiaEntity> findTopBySanPham_MaSPAndTrangThaiTrueOrderByNgayTaoDesc(String maSP);

    @Modifying
    @Query("update LichSuGiaEntity l set l.trangThai=false where l.sanPham.id=:spId and l.trangThai=true")
    int deactivateCurrent(@Param("spId") Long spId);
}

