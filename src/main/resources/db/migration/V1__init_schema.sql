-- Flyway V1: Init schema
-- Nếu DB đã được tạo bởi JDBC (createDatabaseIfNotExist=true) thì có thể bỏ 2 dòng đầu.
CREATE DATABASE IF NOT EXISTS bansach CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bansach;

-- Bảo đảm chế độ và charset
SET NAMES utf8mb4;
SET time_zone = '+00:00';

-- 1) Bảng danh mục/tham chiếu gốc
CREATE TABLE IF NOT EXISTS vai_tro (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  mavt          VARCHAR(255) UNIQUE,
  ten_vai_tro   VARCHAR(255),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS loai_khuyen_mai (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  malkm         VARCHAR(255) UNIQUE,
  mo_ta         VARCHAR(255),
  ten_loaikm    VARCHAR(255),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS khuyen_mai (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  gia_tri       DECIMAL(18,2),
  makm          VARCHAR(255) UNIQUE,
  ngay_ket_thuc DATETIME(6) NULL,
  tenkm         VARCHAR(255),
  trang_thai    BIT(1),
  malkm         VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_km_malkm (malkm),
  CONSTRAINT fk_km_malkm FOREIGN KEY (malkm) REFERENCES loai_khuyen_mai (malkm)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS loai_khach_hang (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  malkh         VARCHAR(255) UNIQUE,
  mo_ta         VARCHAR(255),
  ten_loaikh    VARCHAR(255),
  makm          VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_lkh_makm (makm),
  CONSTRAINT fk_lkh_km FOREIGN KEY (makm) REFERENCES khuyen_mai (makm)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS loai_san_pham (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  malsp         VARCHAR(255) UNIQUE,
  mo_ta         VARCHAR(255),
  ten_loai      VARCHAR(255),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2) Tài khoản/người dùng/nhân sự
CREATE TABLE IF NOT EXISTS tai_khoan (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  matk          VARCHAR(255) UNIQUE,
  mat_khau      VARCHAR(255),
  ten_dang_nhap VARCHAR(255) UNIQUE,
  trang_thai    BIT(1),
  mavt          VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_tk_mavt (mavt),
  CONSTRAINT fk_tk_vt FOREIGN KEY (mavt) REFERENCES vai_tro (mavt)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS khach_hang (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  dia_chi       VARCHAR(255),
  email         VARCHAR(255),
  ho_tenkh      VARCHAR(255),
  makh          VARCHAR(255) UNIQUE,
  sdt           VARCHAR(255),
  tich_diem     DECIMAL(18,2),
  trang_thai    BIT(1),
  malkh         VARCHAR(255),
  matk          VARCHAR(255) NULL,
  PRIMARY KEY (id),
  KEY idx_kh_malkh (malkh),
  KEY idx_kh_matk  (matk),
  CONSTRAINT fk_kh_lkh FOREIGN KEY (malkh) REFERENCES loai_khach_hang (malkh),
  CONSTRAINT fk_kh_tk  FOREIGN KEY (matk)  REFERENCES tai_khoan (matk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS nhan_vien (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  email         VARCHAR(255),
  gioi_tinh     BIT(1),
  ho_tennv      VARCHAR(255),
  manv          VARCHAR(255) UNIQUE,
  ngay_sinh     DATETIME(6),
  sdt           VARCHAR(255),
  trang_thai    BIT(1),
  matk          VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_nv_matk (matk),
  CONSTRAINT fk_nv_tk FOREIGN KEY (matk) REFERENCES tai_khoan (matk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3) NCC / nhập hàng / kho
CREATE TABLE IF NOT EXISTS nha_cung_cap (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  dia_chi       VARCHAR(255),
  email         VARCHAR(255),
  mancc         VARCHAR(255) UNIQUE,
  ngay_ket_thuc DATETIME(6) NULL,
  sdt           VARCHAR(255),
  tenncc        VARCHAR(255),
  trang_thai    BIT(1),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS phieu_nhap (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  chiet_khau    DECIMAL(18,2),
  madxpn        VARCHAR(255),
  mapn          VARCHAR(255) UNIQUE,
  mo_ta         VARCHAR(255),
  tong_tien     DECIMAL(18,2),
  trang_thai    VARCHAR(255),
  mancc         VARCHAR(255),
  manv          VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_pn_ncc (mancc),
  KEY idx_pn_nv  (manv),
  CONSTRAINT fk_pn_ncc FOREIGN KEY (mancc) REFERENCES nha_cung_cap (mancc),
  CONSTRAINT fk_pn_nv  FOREIGN KEY (manv)  REFERENCES nhan_vien (manv)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS san_pham (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  hinh_anh      VARCHAR(255),
  masp          VARCHAR(255) UNIQUE,
  mo_ta         VARCHAR(255),
  tensp         VARCHAR(255),
  trang_thai    BIT(1),
  makm          VARCHAR(255),
  malsp         VARCHAR(255),
  thu_muc_anh   VARCHAR(255),
  thuong_hieu   VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_sp_makm (makm),
  KEY idx_sp_malsp (malsp),
  CONSTRAINT fk_sp_km   FOREIGN KEY (makm)  REFERENCES khuyen_mai (makm),
  CONSTRAINT fk_sp_lsp  FOREIGN KEY (malsp) REFERENCES loai_san_pham (malsp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chi_tiet_phieu_nhap (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  gia_nhap      DECIMAL(18,2),
  mactpn        VARCHAR(255) UNIQUE,
  so_luong      INT,
  tong_tien     DECIMAL(18,2),
  mapn          VARCHAR(255),
  masp          VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_ctpn_pn  (mapn),
  KEY idx_ctpn_sp  (masp),
  CONSTRAINT fk_ctpn_pn FOREIGN KEY (mapn) REFERENCES phieu_nhap (mapn),
  CONSTRAINT fk_ctpn_sp FOREIGN KEY (masp) REFERENCES san_pham (masp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS kho (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  ma_kho        VARCHAR(255) UNIQUE,
  so_luong_ton  INT,
  trang_thai    BIT(1),
  mactpn        VARCHAR(255),
  masp          VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_kho_ctpn (mactpn),
  KEY idx_kho_sp   (masp),
  CONSTRAINT fk_kho_ctpn FOREIGN KEY (mactpn) REFERENCES chi_tiet_phieu_nhap (mactpn),
  CONSTRAINT fk_kho_sp   FOREIGN KEY (masp)   REFERENCES san_pham (masp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4) Bán hàng
CREATE TABLE IF NOT EXISTS hoa_don (
  id                     BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat          DATETIME(6) NULL,
  ngay_tao               DATETIME(6) NULL,
  chiet_khau             DECIMAL(18,2),
  loaihd                 BIT(1),
  mahd                   VARCHAR(255) UNIQUE,
  phuong_thuc_thanh_toan BIT(1),
  tong_tien              DECIMAL(18,2),
  tong_tien_saukm        DECIMAL(18,2),
  trang_thai             VARCHAR(255),
  makh                   VARCHAR(255),
  makm                   VARCHAR(255) NULL,
  manv                   VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_hd_kh (makh),
  KEY idx_hd_km (makm),
  KEY idx_hd_nv (manv),
  CONSTRAINT fk_hd_kh FOREIGN KEY (makh) REFERENCES khach_hang (makh),
  CONSTRAINT fk_hd_km FOREIGN KEY (makm) REFERENCES khuyen_mai (makm),
  CONSTRAINT fk_hd_nv FOREIGN KEY (manv) REFERENCES nhan_vien (manv)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS chi_tiet_hoa_don (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  gia_ban       DECIMAL(18,2),
  macthd        VARCHAR(255) UNIQUE,
  so_luong      INT,
  tong_tien     DECIMAL(18,2),
  mactpn        VARCHAR(255),
  mahd          VARCHAR(255),
  masp          VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_cthd_ctpn (mactpn),
  KEY idx_cthd_hd   (mahd),
  KEY idx_cthd_sp   (masp),
  CONSTRAINT fk_cthd_ctpn FOREIGN KEY (mactpn) REFERENCES chi_tiet_phieu_nhap (mactpn),
  CONSTRAINT fk_cthd_hd   FOREIGN KEY (mahd)  REFERENCES hoa_don (mahd),
  CONSTRAINT fk_cthd_sp   FOREIGN KEY (masp)  REFERENCES san_pham (masp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS binh_luan (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  diem_so       VARCHAR(255),
  mabl          VARCHAR(255) UNIQUE,
  noi_dung      VARCHAR(255),
  trang_thai    BIT(1),
  macthd        VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_bl_cthd (macthd),
  CONSTRAINT fk_bl_cthd FOREIGN KEY (macthd) REFERENCES chi_tiet_hoa_don (macthd)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS phieu_doi_tra (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  ly_do         VARCHAR(255),
  mapdt         VARCHAR(255) UNIQUE,
  trang_thai    BIT(1),
  mahd          VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_pdt_hd (mahd),
  CONSTRAINT fk_pdt_hd FOREIGN KEY (mahd) REFERENCES hoa_don (mahd)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS gio_hang (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  so_luong      INT,
  tong_tien     DECIMAL(18,2),
  makh          VARCHAR(255),
  masp          VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_gh_kh (makh),
  KEY idx_gh_sp (masp),
  CONSTRAINT fk_gh_kh FOREIGN KEY (makh) REFERENCES khach_hang (makh),
  CONSTRAINT fk_gh_sp FOREIGN KEY (masp)  REFERENCES san_pham (masp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS lich_su_gia (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  gia_ban       DECIMAL(18,2),
  malsg         VARCHAR(255) UNIQUE,
  ngay_ket_thuc DATETIME(6) NULL,
  trang_thai    BIT(1),
  mactpn        VARCHAR(255),
  masp          VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_lsg_ctpn (mactpn),
  KEY idx_lsg_sp   (masp),
  CONSTRAINT fk_lsg_ctpn FOREIGN KEY (mactpn) REFERENCES chi_tiet_phieu_nhap (mactpn),
  CONSTRAINT fk_lsg_sp   FOREIGN KEY (masp)   REFERENCES san_pham (masp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS yeu_thich (
  id            BIGINT NOT NULL AUTO_INCREMENT,
  ngay_cap_nhat DATETIME(6) NULL,
  ngay_tao      DATETIME(6) NULL,
  makh          VARCHAR(255),
  masp          VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_yt_kh (makh),
  KEY idx_yt_sp (masp),
  CONSTRAINT fk_yt_kh FOREIGN KEY (makh) REFERENCES khach_hang (makh),
  CONSTRAINT fk_yt_sp FOREIGN KEY (masp)  REFERENCES san_pham (masp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
