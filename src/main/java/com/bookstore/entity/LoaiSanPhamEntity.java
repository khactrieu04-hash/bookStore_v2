package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.util.List;

@Entity
@Table(name = "LoaiSanPham")
@Data
public class LoaiSanPhamEntity extends BaseEntity {

    @Column(name = "MaLSP", unique = true)
    private String maLSP;

    @Column(name = "TenLoai")
    private String tenLoai;

    @Column(name = "MoTa")
    private String moTa;

    @OneToMany(mappedBy = "loaiSanPham", fetch = FetchType.LAZY)
    private List<SanPhamEntity> sanPhams;
}
