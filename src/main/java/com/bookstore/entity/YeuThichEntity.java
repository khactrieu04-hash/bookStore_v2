package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "YeuThich")
@Data
public class YeuThichEntity extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaSP", referencedColumnName = "MaSP")
    private SanPhamEntity sanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaKH", referencedColumnName = "MaKH")
    private KhachHangEntity khachHang;
}
