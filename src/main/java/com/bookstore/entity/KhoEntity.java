package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.sql.Timestamp;

@Entity
@Table(name = "Kho")
@Data
public class KhoEntity extends BaseEntity {

    @Column(name = "MaKho", unique = true)
    private String maKho;

    @Column(name = "SoLuongTon")
    private Integer soLuongTon;

    @Column(name = "TrangThai")
    private Boolean trangThai;

    @Column(name = "NgayCapNhat")
    private Timestamp ngayCapNhat;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaSP", referencedColumnName = "MaSP")
    private SanPhamEntity sanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaCTPN", referencedColumnName = "MaCTPN")
    private ChiTietPhieuNhapEntity chiTietPhieuNhap;
}
