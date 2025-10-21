package com.bookstore.api;

import java.math.BigDecimal;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bookstore.dto.BookCardResponse;
import com.bookstore.entity.LichSuGiaEntity;
import com.bookstore.entity.SanPhamEntity;
import com.bookstore.repository.LichSuGiaRepository;
import com.bookstore.repository.SanPhamRepository;
import com.bookstore.service.ImageService_1;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/public/books")
@RequiredArgsConstructor
public class PublicBookCardAPI {

    private final SanPhamRepository sanPhamRepository;
    private final LichSuGiaRepository lichSuGiaRepository;
    private final ImageService_1 imageService;

    @GetMapping
    public Page<BookCardResponse> list(@RequestParam(defaultValue = "0") int page,
                                       @RequestParam(defaultValue = "12") int size) {
        return sanPhamRepository.findAll(PageRequest.of(page, size))
                .map(this::toCard);
    }

    @GetMapping("/{maSP}")
    public BookCardResponse one(@PathVariable String maSP) {
        SanPhamEntity sp = sanPhamRepository.findByMaSP(maSP)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy sản phẩm: " + maSP));
        return toCard(sp);
    }

    private BookCardResponse toCard(SanPhamEntity sp) {
        // Lấy giá hiện hành
        BigDecimal price = lichSuGiaRepository
                .findTopBySanPham_MaSPAndTrangThaiTrueOrderByNgayTaoDesc(sp.getMaSP())
                .map(LichSuGiaEntity::getGiaBan)
                .orElse(BigDecimal.ZERO);

        // Quy ước: cột thuMucAnh lưu tên thư mục ảnh của sách (vd: "tieu-thuyet/1")
        String imageUrl;
        if (sp.getHinhAnh() != null && !sp.getHinhAnh().isBlank()) {
            // Nếu DB đã lưu hẳn file ảnh => ưu tiên nó
            imageUrl = "/images/" + (sp.getThuMucAnh() == null ? "" : sp.getThuMucAnh() + "/")
                    + sp.getHinhAnh();
        } else {
            imageUrl = imageService.pickPrimaryImageUrl(sp.getThuMucAnh());
        }

        return BookCardResponse.builder()
                .id(sp.getMaSP())
                .name(sp.getTenSP())
                .brand(sp.getThuongHieu()) // hoặc tác giả/NXB tùy bạn map
                .category(sp.getLoaiSanPham() != null ? sp.getLoaiSanPham().getTenLoai() : null)
                .description(sp.getMoTa())
                .price(price)
                .image(imageUrl)
                .build();
    }
}
