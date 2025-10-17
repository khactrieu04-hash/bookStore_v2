// com.bookstore.api.ProductPublicApi.java
package com.bookstore.api;

import java.math.BigDecimal;
import java.text.Normalizer;
import java.util.List;
import java.util.Locale;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.bookstore.dto.ProductJson;
import com.bookstore.entity.LichSuGiaEntity;
import com.bookstore.entity.SanPhamEntity;
import com.bookstore.repository.LichSuGiaRepository;
import com.bookstore.repository.SanPhamRepository;
import com.bookstore.service.ImageService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/san-pham")
@RequiredArgsConstructor
public class ProductPublicApi {

    private final SanPhamRepository sanPhamRepository;
    private final LichSuGiaRepository lichSuGiaRepository;
    private final ImageService imageService;

    @GetMapping
    public List<ProductJson> all() {
        return sanPhamRepository.findAll()
                .stream().map(this::toJson).toList();
    }

    @GetMapping("/{value}")
    public ProductJson one(@PathVariable("value") String value) {
        SanPhamEntity sp;

        if (value.matches("\\d+")) {
            Long id = Long.valueOf(value);
            sp = sanPhamRepository.findById(id)
                    .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy id: " + id));
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

        String folder = sp.getThuMucAnh();
        if (folder == null || folder.isBlank()) folder = slug(sp.getTenSP());

        // chuẩn hóa tên ảnh (chỉ lấy tên file, bỏ ổ D:\data_sach\)
        String fileName = sp.getHinhAnh();
        if (fileName != null) {
            fileName = fileName.replace("\\", "/");
            int lastSlash = fileName.lastIndexOf('/');
            if (lastSlash >= 0) {
                fileName = fileName.substring(lastSlash + 1);
            }
        }

        // build URL public
        String baseUrl = ServletUriComponentsBuilder.fromCurrentContextPath().build().toUriString();
        String imageUrl = baseUrl + "/images/" + folder + "/" + fileName;

        return ProductJson.builder()
                .id(sp.getMaSP())
                .name(sp.getTenSP())
                .brand(sp.getThuongHieu())
                .category(sp.getLoaiSanPham() != null ? sp.getLoaiSanPham().getTenLoai() : null)
                .description(sp.getMoTa())
                .price(price)
                .images(List.of(imageUrl))
                .build();
    }

    private static String slug(String s) {
        if (s == null) return "";
        return Normalizer.normalize(s, Normalizer.Form.NFD)
                .replaceAll("\\p{M}+", "")
                .toLowerCase(Locale.ROOT)
                .replaceAll("[^a-z0-9]+", "-")
                .replaceAll("(^-|-$)", "");
    }
}
