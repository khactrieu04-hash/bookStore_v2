package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "TaiKhoan")
@Data
public class TaiKhoanEntity extends BaseEntity {

    @Column(name = "MaTK", unique = true)
    private String maTK;

    @Column(name = "TenDangNhap", unique = true)
    private String tenDangNhap;

    @Column(name = "MatKhau")
    private String matKhau;

    @Column(name = "TrangThai")
    private Boolean trangThai;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaVT", referencedColumnName = "MaVT")
    private VaiTroEntity vaiTro;

    @OneToMany(mappedBy = "taiKhoan", fetch = FetchType.LAZY)
    private List<NhanVienEntity> nhanViens;

    @OneToMany(mappedBy = "taiKhoan", fetch = FetchType.LAZY)
    private List<KhachHangEntity> khachHangs;
}
