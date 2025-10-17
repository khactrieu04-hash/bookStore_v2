package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.util.List;

@Entity
@Table(name = "VaiTro")
@Data
public class VaiTroEntity extends BaseEntity {

    @Column(name = "MaVT", unique = true)
    private String maVT;

    @Column(name = "TenVaiTro")
    private String tenVaiTro;

    @OneToMany(mappedBy = "vaiTro", fetch = FetchType.LAZY)
    private List<TaiKhoanEntity> taiKhoans;
}
