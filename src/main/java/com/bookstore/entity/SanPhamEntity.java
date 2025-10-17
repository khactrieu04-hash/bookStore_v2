package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "SanPham")
@Data
public class SanPhamEntity extends BaseEntity {

    @Column(name = "MaSP", unique = true)
    private String maSP;

    @Column(name = "TenSP")
    private String tenSP;

    @Column(name = "MoTa")
    private String moTa;

    @Column(name = "HinhAnh")
    private String hinhAnh;

    @Column(name = "TrangThai")
    private Boolean trangThai;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaLSP", referencedColumnName = "MaLSP")
    private LoaiSanPhamEntity loaiSanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaKM", referencedColumnName = "MaKM")
    private KhuyenMaiEntity khuyenMai;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
    @com.fasterxml.jackson.annotation.JsonIgnore
    private List<LichSuGiaEntity> lichSuGiaList;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
    @com.fasterxml.jackson.annotation.JsonIgnore
    private List<KhoEntity> khoList;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
    @com.fasterxml.jackson.annotation.JsonIgnore
    private List<ChiTietPhieuNhapEntity> chiTietPhieuNhapList;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
    @com.fasterxml.jackson.annotation.JsonIgnore
    private List<ChiTietHoaDonEntity> chiTietHoaDonList;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
    @com.fasterxml.jackson.annotation.JsonIgnore
    private List<GioHangEntity> gioHangList;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
    private List<YeuThichEntity> yeuThichList;
    @Column(name = "thu_muc_anh")      
    private String thuMucAnh;

    @Column(name = "thuong_hieu")          
    private String thuongHieu;
}
