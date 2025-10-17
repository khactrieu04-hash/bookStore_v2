package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.util.List;

@Entity
@Table(name = "LoaiKhachHang")
@Data
public class LoaiKhachHangEntity extends BaseEntity {

    @Column(name = "MaLKH", unique = true)
    private String maLKH;

    @Column(name = "TenLoaiKH")
    private String tenLoaiKH;

    @Column(name = "MoTa")
    private String moTa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaKM", referencedColumnName = "MaKM")
    private KhuyenMaiEntity khuyenMai;

    @OneToMany(mappedBy = "loaiKhachHang", fetch = FetchType.LAZY)
    private List<KhachHangEntity> khachHangs;
}
