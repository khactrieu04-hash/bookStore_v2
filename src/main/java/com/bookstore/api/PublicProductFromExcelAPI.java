package com.bookstore.api;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bookstore.dto.ProductPublicResponse;
import com.bookstore.service.ImageService;
import com.bookstore.service.ProductExcelService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/public/excel-products") // tránh đụng với controller dùng DB
@RequiredArgsConstructor
public class PublicProductFromExcelAPI {
	private final ProductExcelService excelService;
	private final ImageService imageService;

	@GetMapping
	public List<ProductPublicResponse> all() {
		return excelService.findAll().stream()
				.map(p -> p.toBuilder().images(imageService.listPublicImageUrlsByFolder(suggestFolder(p))).build())
				.toList(); // nếu IDE báo đỏ, xem mục 3
	}

	@GetMapping("/{id}")
	public ProductPublicResponse one(@PathVariable String id) {
		return excelService.findAll().stream().filter(p -> id != null && id.equals(p.getId())).findFirst()
				.map(p -> p.toBuilder().images(imageService.listPublicImageUrlsByFolder(suggestFolder(p))).build())
				.orElseThrow(() -> new IllegalArgumentException("Không tìm thấy sản phẩm: " + id));
	}

	private String suggestFolder(ProductPublicResponse p) {
		if (p.getImageFolder() != null && !p.getImageFolder().isBlank())
			return p.getImageFolder().trim().replace("\\", "/").replace(" ", "-");
		return slugify(p.getName());
	}

	private String slugify(String s) {
		if (s == null)
			return "";
		String x = java.text.Normalizer.normalize(s, java.text.Normalizer.Form.NFD).replaceAll("\\p{M}+", "")
				.toLowerCase(java.util.Locale.ROOT).replaceAll("[^a-z0-9]+", "-").replaceAll("(^-|-$)", "");
		return x;
	}
}
