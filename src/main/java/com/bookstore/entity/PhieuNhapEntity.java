package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "PhieuNhap")
@Data
public class PhieuNhapEntity extends BaseEntity {

    @Column(name = "MaPN", unique = true)
    private String maPN;

    @Column(name = "ChietKhau", precision = 18, scale = 2)
    private BigDecimal chietKhau;

    @Column(name = "TrangThai")
    private String trangThai;

    @Column(name = "TongTien", precision = 18, scale = 2)
    private BigDecimal tongTien;

    @Column(name = "MoTa")
    private String moTa;

    @Column(name = "MaDXPN")
    private String maDXPN;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaNV", referencedColumnName = "MaNV")
    private NhanVienEntity nhanVien;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaNCC", referencedColumnName = "MaNCC")
    private NhaCungCapEntity nhaCungCap;

    @OneToMany(mappedBy = "phieuNhap", fetch = FetchType.LAZY)
    private List<ChiTietPhieuNhapEntity> chiTietList;
}
