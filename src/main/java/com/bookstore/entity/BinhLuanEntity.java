package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.sql.Timestamp;

@Entity
@Table(name = "BinhLuan")
@Data
public class BinhLuanEntity extends BaseEntity {

    @Column(name = "MaBL", unique = true)
    private String maBL;

    @Column(name = "NoiDung")
    private String noiDung;

    @Column(name = "DiemSo")
    private String diemSo;

    @Column(name = "TrangThai")
    private Boolean trangThai;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaCTHD", referencedColumnName = "MaCTHD")
    private ChiTietHoaDonEntity chiTietHoaDon;
}
