package com.bookstore.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "NhaCungCap")
@Data
public class NhaCungCapEntity extends BaseEntity {

    @Column(name = "MaNCC", unique = true)
    private String maNCC;

    @Column(name = "TenNCC")
    private String tenNCC;

    @Column(name = "DiaChi")
    private String diaChi;

    @Column(name = "SDT")
    private String sdt;

    @Column(name = "Email")
    private String email;

    @Column(name = "TrangThai")
    private Boolean trangThai;

    @Column(name = "NgayKetThuc")
    private Timestamp ngayKetThuc;

    @OneToMany(mappedBy = "nhaCungCap", fetch = FetchType.LAZY)
    private List<PhieuNhapEntity> phieuNhaps;
}
