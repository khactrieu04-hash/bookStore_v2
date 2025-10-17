package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "NhanVien")
@Data
public class NhanVienEntity extends BaseEntity {

    @Column(name = "MaNV", unique = true)
    private String maNV;

    @Column(name = "HoTenNV")
    private String hoTenNV;

    @Column(name = "NgaySinh")
    private Timestamp ngaySinh;

    @Column(name = "GioiTinh")
    private Boolean gioiTinh;

    @Column(name = "SDT")
    private String sdt;

    @Column(name = "Email")
    private String email;

    @Column(name = "TrangThai")
    private Boolean trangThai;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaTK", referencedColumnName = "MaTK")
    private TaiKhoanEntity taiKhoan;

    @OneToMany(mappedBy = "nhanVien", fetch = FetchType.LAZY)
    private List<PhieuNhapEntity> phieuNhaps;

    @OneToMany(mappedBy = "nhanVien", fetch = FetchType.LAZY)
    private List<HoaDonEntity> hoaDons;
}
