package com.bookstore.service;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.*;
import java.util.Comparator;
import java.util.Locale;
@Service
public class ImageService_1 {
	@Value("${app.files.images-dir}")     // ví dụ: D:\\data_sach
    private String imagesDir;

    // Lấy 1 ảnh đầu tiên trong thư mục (ưu tiên số thứ tự)
    public String pickPrimaryImageUrl(String folder) {
        if (folder == null || folder.isBlank()) return null;

        Path dir = Paths.get(imagesDir).resolve(folder);
        if (!Files.isDirectory(dir)) return null;

        try {
            String filename = Files.list(dir)
                .filter(Files::isRegularFile)
                .map(p -> p.getFileName().toString())
                .filter(n -> n.toLowerCase(Locale.ROOT).matches(".*\\.(jpg|jpeg|png|webp)$"))
                .sorted(Comparator
                    .comparing((String n) -> n.replaceAll("[^0-9]", "").isEmpty()
                            ? Integer.MAX_VALUE
                            : Integer.parseInt(n.replaceAll("[^0-9]", "")))
                    .thenComparing(n -> n))
                .findFirst().orElse(null);

            return filename == null ? null : "/images/" + folder.replace("\\","/") + "/" + filename;
        } catch (IOException e) {
            return null;
        }
    }
}
