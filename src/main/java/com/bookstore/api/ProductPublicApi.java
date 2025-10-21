// com.bookstore.api.ProductPublicApi.java
package com.bookstore.api;

import java.math.BigDecimal;
import java.text.Normalizer;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import com.bookstore.dto.ProductJson;
import com.bookstore.entity.LichSuGiaEntity;
import com.bookstore.entity.SanPhamEntity;
import com.bookstore.repository.LichSuGiaRepository;
import com.bookstore.repository.SanPhamRepository;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/san-pham")
@RequiredArgsConstructor
public class ProductPublicApi {

  private final SanPhamRepository sanPhamRepository;
  private final LichSuGiaRepository lichSuGiaRepository;

  // lấy base URL từ cấu hình, mặc định localhost:8080
  @Value("${app.base-url:http://localhost:8080}")
  private String baseUrl;

  @GetMapping
  public java.util.List<ProductJson> all() {
    return sanPhamRepository.findAll().stream().map(this::toJson).toList();
  }

  @GetMapping("/{value}")
  public ProductJson one(@PathVariable String value) {
    SanPhamEntity sp;
    if (value.matches("\\d+")) {
      sp = sanPhamRepository.findById(Long.valueOf(value))
          .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy id: " + value));
    } else {
      sp = sanPhamRepository.findByMaSP(value)
          .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy mã: " + value));
    }
    return toJson(sp);
  }

  private ProductJson toJson(SanPhamEntity sp) {
    BigDecimal price = lichSuGiaRepository
        .findTopBySanPham_MaSPAndTrangThaiTrueOrderByNgayTaoDesc(sp.getMaSP())
        .map(LichSuGiaEntity::getGiaBan)
        .orElse(BigDecimal.ZERO);

    String folder = (sp.getThuMucAnh() == null || sp.getThuMucAnh().isBlank())
        ? slug(sp.getTenSP())
        : sp.getThuMucAnh();

    String imageUrl = baseUrl + "/images/" + folder + "/" + sp.getHinhAnh();

    return ProductJson.builder()
        .id(sp.getMaSP())
        .name(sp.getTenSP())
        .brand(sp.getThuongHieu())
        .category(sp.getLoaiSanPham() != null ? sp.getLoaiSanPham().getTenLoai() : null)
        .description(sp.getMoTa())
        .price(price)
        .images(java.util.List.of(imageUrl))              	
        .build();
  }

  private static String slug(String s) {
    if (s == null) return "";
    return Normalizer.normalize(s, Normalizer.Form.NFD)
        .replaceAll("\\p{M}+","")
        .toLowerCase(Locale.ROOT)
        .replaceAll("[^a-z0-9]+","-")
        .replaceAll("(^-|-$)","");
  }
}
