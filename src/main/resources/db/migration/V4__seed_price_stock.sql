-- V4__seed_price_stock.sql
-- Sinh phieu_nhap, chi_tiet_phieu_nhap, lich_su_gia, kho cho toàn bộ sản phẩm theo quy tắc

SET NAMES utf8mb4;
SET time_zone = '+00:00';

START TRANSACTION;

-- BẢO ĐẢM dữ liệu FK tối thiểu tồn tại
-- Vai trò/nhân viên/tài khoản tối thiểu (nếu chưa có)
INSERT INTO vai_tro (mavt, ten_vai_tro, ngay_tao, ngay_cap_nhat)
VALUES ('NV_KHO','Nhân viên kho',NOW(6),NOW(6))
ON DUPLICATE KEY UPDATE ten_vai_tro=VALUES(ten_vai_tro), ngay_cap_nhat=NOW(6);

INSERT INTO tai_khoan (matk, ten_dang_nhap, mat_khau, trang_thai, mavt, ngay_tao, ngay_cap_nhat)
VALUES ('TK_NV_KHO','nvkho','$2a$10$bz.P4YnSDtcS.derj5g9AuwvYylZU7gGk1jBGngg2PWBFZBdS3T0G', b'1', 'NV_KHO', NOW(6), NOW(6))
ON DUPLICATE KEY UPDATE ten_dang_nhap=VALUES(ten_dang_nhap), mavt=VALUES(mavt), ngay_cap_nhat=NOW(6);

INSERT INTO nhan_vien (manv, ho_tennv, email, gioi_tinh, ngay_sinh, sdt, trang_thai, matk, ngay_tao, ngay_cap_nhat)
VALUES ('NV001','Nguyễn Văn Kho','nv.kho@example.com', b'1', '1995-05-05 00:00:00', '0902000001', b'1', 'TK_NV_KHO', NOW(6), NOW(6))
ON DUPLICATE KEY UPDATE ho_tennv=VALUES(ho_tennv), email=VALUES(email), trang_thai=VALUES(trang_thai), matk=VALUES(matk), ngay_cap_nhat=NOW(6);

-- Nhà cung cấp tối thiểu
INSERT INTO nha_cung_cap (mancc, tenncc, email, sdt, dia_chi, trang_thai, ngay_tao, ngay_cap_nhat)
VALUES 
 ('NCC001','NXB Trẻ','contact@nxbtre.vn','0901000001','TP.HCM', b'1', NOW(6), NOW(6)),
 ('NCC004','Thiên Long','tl@gmail.com','0347684232','TP.HCM', b'1', NOW(6), NOW(6))
ON DUPLICATE KEY UPDATE tenncc=VALUES(tenncc), email=VALUES(email), sdt=VALUES(sdt), dia_chi=VALUES(dia_chi), trang_thai=VALUES(trang_thai), ngay_cap_nhat=NOW(6);

-- Hai phiếu nhập: 1 cho SÁCH, 1 cho VPP
INSERT INTO phieu_nhap (mapn, mo_ta, chiet_khau, tong_tien, trang_thai, mancc, manv, ngay_tao, ngay_cap_nhat)
VALUES 
 ('PN_SACH_2025','Nhập hàng SÁCH seed', 0.00, 0.00, 'DA_NHAP', 'NCC001', 'NV001', NOW(6), NOW(6)),
 ('PN_VPP_2025','Nhập hàng VPP seed',  0.00, 0.00, 'DA_NHAP', 'NCC004', 'NV001', NOW(6), NOW(6))
ON DUPLICATE KEY UPDATE mo_ta=VALUES(mo_ta), trang_thai=VALUES(trang_thai), mancc=VALUES(mancc), manv=VALUES(manv), ngay_cap_nhat=NOW(6);

-- ==========================================
-- 1) Insert CHI_TIET_PHIEU_NHAP theo quy tắc
-- ==========================================
-- Quy tắc sinh:
--  - mactpn = 'CTPN' + số từ masp (pad 3)
--  - mapn: SÁCH -> PN_SACH_2025, VPP -> PN_VPP_2025
--  - gia_nhap = ((num % 7) + 10) * 10000
--  - so_luong = (num % 5) + 5
--  - tong_tien = gia_nhap * so_luong

INSERT INTO chi_tiet_phieu_nhap (mactpn, mapn, masp, gia_nhap, so_luong, tong_tien, ngay_tao, ngay_cap_nhat)
SELECT
  CONCAT('CTPN', LPAD(CAST(SUBSTRING(s.masp,3) AS UNSIGNED), 3, '0')) AS mactpn,
  CASE WHEN s.malsp = 'VPP' THEN 'PN_VPP_2025' ELSE 'PN_SACH_2025' END AS mapn,
  s.masp,
  /* gia_nhap */ ( ((CAST(SUBSTRING(s.masp,3) AS UNSIGNED) % 7) + 10) * 10000 ) AS gia_nhap,
  /* so_luong */ ( (CAST(SUBSTRING(s.masp,3) AS UNSIGNED) % 5) + 5 ) AS so_luong,
  /* tong_tien */ ( ((CAST(SUBSTRING(s.masp,3) AS UNSIGNED) % 7) + 10) * 10000 ) * ( (CAST(SUBSTRING(s.masp,3) AS UNSIGNED) % 5) + 5 ) AS tong_tien,
  NOW(6), NOW(6)
FROM san_pham s
WHERE s.masp IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM chi_tiet_phieu_nhap c WHERE c.mactpn = CONCAT('CTPN', LPAD(CAST(SUBSTRING(s.masp,3) AS UNSIGNED), 3, '0'))
  );

-- ==========================================
-- 2) Insert LICH_SU_GIA (giá bán = 1.2 * gia_nhap, làm tròn 1.000)
-- ==========================================
-- Quy tắc sinh:
--  - malsg = 'LSG' + số từ masp
--  - mactpn = CTPN###
--  - gia_ban = CEIL(gia_nhap * 1.2 / 1000) * 1000

INSERT INTO lich_su_gia (malsg, mactpn, masp, gia_ban, ngay_ket_thuc, trang_thai, ngay_tao, ngay_cap_nhat)
SELECT
  CONCAT('LSG', LPAD(CAST(SUBSTRING(s.masp,3) AS UNSIGNED), 3, '0')) AS malsg,
  CONCAT('CTPN', LPAD(CAST(SUBSTRING(s.masp,3) AS UNSIGNED), 3, '0')) AS mactpn,
  s.masp,
  /* gia_ban */ CEIL( ( ((CAST(SUBSTRING(s.masp,3) AS UNSIGNED) % 7) + 10) * 10000 ) * 1.2 / 1000 ) * 1000 AS gia_ban,
  NULL,
  b'1',
  NOW(6), NOW(6)
FROM san_pham s
WHERE s.masp IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM lich_su_gia l 
    WHERE l.malsg = CONCAT('LSG', LPAD(CAST(SUBSTRING(s.masp,3) AS UNSIGNED), 3, '0'))
  )
ON DUPLICATE KEY UPDATE
  gia_ban=VALUES(gia_ban),
  trang_thai=VALUES(trang_thai),
  ngay_cap_nhat=NOW(6);

-- ==========================================
-- 3) Insert KHO (tồn kho ban đầu = số_lượng nhập)
-- ==========================================
-- Quy tắc sinh:
--  - ma_kho = 'KHO' + số từ masp
--  - so_luong_ton = so_luong trong chi_tiet_phieu_nhap
--  - liên kết đúng mactpn/masp

INSERT INTO kho (ma_kho, masp, mactpn, so_luong_ton, trang_thai, ngay_tao, ngay_cap_nhat)
SELECT
  CONCAT('KHO', LPAD(CAST(SUBSTRING(s.masp,3) AS UNSIGNED), 3, '0')) AS ma_kho,
  s.masp,
  CONCAT('CTPN', LPAD(CAST(SUBSTRING(s.masp,3) AS UNSIGNED), 3, '0')) AS mactpn,
  c.so_luong AS so_luong_ton,
  b'1',
  NOW(6), NOW(6)
FROM san_pham s
JOIN chi_tiet_phieu_nhap c 
  ON c.mactpn = CONCAT('CTPN', LPAD(CAST(SUBSTRING(s.masp,3) AS UNSIGNED), 3, '0'))
WHERE NOT EXISTS (
  SELECT 1 FROM kho k 
  WHERE k.ma_kho = CONCAT('KHO', LPAD(CAST(SUBSTRING(s.masp,3) AS UNSIGNED), 3, '0'))
);

-- ==========================================
-- 4) Cập nhật tổng tiền cho phiếu nhập từ chi tiết
-- ==========================================
UPDATE phieu_nhap pn
JOIN (
  SELECT mapn, SUM(tong_tien) AS sum_tt
  FROM chi_tiet_phieu_nhap
  GROUP BY mapn
) x ON x.mapn = pn.mapn
SET pn.tong_tien = x.sum_tt,
    pn.ngay_cap_nhat = NOW(6)
WHERE pn.mapn IN ('PN_SACH_2025','PN_VPP_2025');

COMMIT;
