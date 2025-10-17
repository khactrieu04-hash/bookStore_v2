package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.sql.Timestamp;

@Entity
@Table(name = "LichSuGia")
@Data
public class LichSuGiaEntity extends BaseEntity {

    @Column(name = "MaLSG", unique = true)
    private String maLSG;

    @Column(name = "GiaBan", precision = 18, scale = 2)
    private BigDecimal giaBan;

    @Column(name = "TrangThai")
    private Boolean trangThai;

    @Column(name = "NgayKetThuc")
    private Timestamp ngayKetThuc;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaSP", referencedColumnName = "MaSP")
    private SanPhamEntity sanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaCTPN", referencedColumnName = "MaCTPN")
    private ChiTietPhieuNhapEntity chiTietPhieuNhap;
}
