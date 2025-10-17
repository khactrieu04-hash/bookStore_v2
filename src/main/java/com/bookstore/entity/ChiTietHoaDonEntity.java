package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "ChiTietHoaDon")
@Data
public class ChiTietHoaDonEntity extends BaseEntity {

    @Column(name = "MaCTHD", unique = true)
    private String maCTHD;

    @Column(name = "SoLuong")
    private Integer soLuong;

    @Column(name = "GiaBan", precision = 18, scale = 2)
    private BigDecimal giaBan;

    @Column(name = "TongTien", precision = 18, scale = 2)
    private BigDecimal tongTien;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaSP", referencedColumnName = "MaSP")
    
    private SanPhamEntity sanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaHD", referencedColumnName = "MaHD")
    private HoaDonEntity hoaDon;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaCTPN", referencedColumnName = "MaCTPN")
    private ChiTietPhieuNhapEntity chiTietPhieuNhap;

    @OneToMany(mappedBy = "chiTietHoaDon", fetch = FetchType.LAZY)
    private List<BinhLuanEntity> binhLuans;
}
