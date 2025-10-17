package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "ChiTietPhieuNhap")
@Data
public class ChiTietPhieuNhapEntity extends BaseEntity {

    @Column(name = "MaCTPN", unique = true)
    private String maCTPN;

    @Column(name = "SoLuong")
    private Integer soLuong;

    @Column(name = "GiaNhap", precision = 18, scale = 2)
    private BigDecimal giaNhap;

    @Column(name = "TongTien", precision = 18, scale = 2)
    private BigDecimal tongTien;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaSP", referencedColumnName = "MaSP")
    
    private SanPhamEntity sanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaPN", referencedColumnName = "MaPN")
    private PhieuNhapEntity phieuNhap;

    @OneToMany(mappedBy = "chiTietPhieuNhap", fetch = FetchType.LAZY)
    private List<LichSuGiaEntity> lichSuGiaList;

    @OneToMany(mappedBy = "chiTietPhieuNhap", fetch = FetchType.LAZY)
    private List<KhoEntity> khoList;

    @OneToMany(mappedBy = "chiTietPhieuNhap", fetch = FetchType.LAZY)
    private List<ChiTietHoaDonEntity> chiTietHoaDonList;
}
