package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.util.List;

@Entity
@Table(name = "LoaiKhuyenMai")
@Data
public class LoaiKhuyenMaiEntity extends BaseEntity {

    @Column(name = "MaLKM", unique = true)
    private String maLKM;

    @Column(name = "TenLoaiKM")
    private String tenLoaiKM;

    @Column(name = "MoTa")
    private String moTa;

    @OneToMany(mappedBy = "loaiKhuyenMai", fetch = FetchType.LAZY)
    private List<KhuyenMaiEntity> khuyenMais;
}
