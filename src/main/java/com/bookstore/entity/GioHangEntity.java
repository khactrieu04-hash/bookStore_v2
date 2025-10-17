package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;

@Entity
@Table(name = "GioHang")
@Data
public class GioHangEntity extends BaseEntity {

    @Column(name = "SoLuong")
    private Integer soLuong;

    @Column(name = "TongTien", precision = 18, scale = 2)
    private BigDecimal tongTien;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaSP", referencedColumnName = "MaSP")
    private SanPhamEntity sanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaKH", referencedColumnName = "MaKH")
    private KhachHangEntity khachHang;
}
