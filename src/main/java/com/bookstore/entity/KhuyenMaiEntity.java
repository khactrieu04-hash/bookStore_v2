package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "KhuyenMai")
@Data
public class KhuyenMaiEntity extends BaseEntity {

    @Column(name = "MaKM", unique = true)
    private String maKM;

    @Column(name = "TenKM")
    private String tenKM;

    @Column(name = "GiaTri", precision = 18, scale = 2)
    private BigDecimal giaTri;

    @Column(name = "TrangThai")
    private Boolean trangThai;

    @Column(name = "NgayKetThuc")
    private Timestamp ngayKetThuc;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaLKM", referencedColumnName = "MaLKM")
    private LoaiKhuyenMaiEntity loaiKhuyenMai;

    @OneToMany(mappedBy = "khuyenMai", fetch = FetchType.LAZY)
    private List<LoaiKhachHangEntity> loaiKhachHangs;

    @OneToMany(mappedBy = "khuyenMai", fetch = FetchType.LAZY)
    private List<SanPhamEntity> sanPhams;

    @OneToMany(mappedBy = "khuyenMai", fetch = FetchType.LAZY)
    private List<HoaDonEntity> hoaDons;
}
