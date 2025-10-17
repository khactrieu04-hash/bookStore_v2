package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.sql.Timestamp;

@Entity
@Table(name = "PhieuDoiTra")
@Data
public class PhieuDoiTraEntity extends BaseEntity {

    @Column(name = "MaPDT", unique = true)
    private String maPDT;

    @Column(name = "LyDo")
    private String lyDo;

    @Column(name = "TrangThai")
    private Boolean trangThai;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaHD", referencedColumnName = "MaHD")
    private HoaDonEntity hoaDon;
}
