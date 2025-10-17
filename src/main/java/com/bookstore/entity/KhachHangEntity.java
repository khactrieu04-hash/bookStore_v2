package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "KhachHang")
@Data
public class KhachHangEntity extends BaseEntity {

    @Column(name = "MaKH", unique = true)
    private String maKH;

    @Column(name = "HoTenKH")
    private String hoTenKH;

    @Column(name = "Email")
    private String email;

    @Column(name = "TichDiem", precision = 18, scale = 2)
    private BigDecimal tichDiem;

    @Column(name = "SDT")
    private String sdt;

    @Column(name = "DiaChi")
    private String diaChi;

    @Column(name = "TrangThai")
    private Boolean trangThai;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaLKH", referencedColumnName = "MaLKH")
    private LoaiKhachHangEntity loaiKhachHang;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaTK", referencedColumnName = "MaTK")
    private TaiKhoanEntity taiKhoan;

    @OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
    private java.util.List<HoaDonEntity> hoaDons;

    @OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
    private java.util.List<GioHangEntity> gioHangs;

    @OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
    private java.util.List<YeuThichEntity> yeuThichs;
}
