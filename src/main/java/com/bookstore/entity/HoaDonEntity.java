package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "HoaDon")
@Data
public class HoaDonEntity extends BaseEntity {

    @Column(name = "MaHD", unique = true)
    private String maHD;

    @Column(name = "LoaiHD")
    private Boolean loaiHD;

    @Column(name = "PhuongThucThanhToan")
    private Boolean phuongThucThanhToan;

    @Column(name = "TrangThai")
    private String trangThai;

    @Column(name = "ChietKhau", precision = 18, scale = 2)
    private BigDecimal chietKhau;

    @Column(name = "TongTien", precision = 18, scale = 2)
    private BigDecimal tongTien;

    @Column(name = "TongTienSauKM", precision = 18, scale = 2)
    private BigDecimal tongTienSauKM;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaKH", referencedColumnName = "MaKH")
    private KhachHangEntity khachHang;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaNV", referencedColumnName = "MaNV")
    private NhanVienEntity nhanVien;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaKM", referencedColumnName = "MaKM")
    private KhuyenMaiEntity khuyenMai;

    @OneToMany(mappedBy = "hoaDon", fetch = FetchType.LAZY)
    private List<ChiTietHoaDonEntity> chiTietList;

    @OneToMany(mappedBy = "hoaDon", fetch = FetchType.LAZY)
    private List<PhieuDoiTraEntity> phieuDoiTras;
}
