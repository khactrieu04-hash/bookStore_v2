// ImageServiceImpl.java
package com.bookstore.service.impl;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.bookstore.service.ImageService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ImageServiceImpl implements ImageService {

	@Value("${app.files.images-dir}") // ví dụ: D:\data_sach
    private String imagesDir;

    @Override
    public List<String> listPublicImageUrlsByFolder(String folder) {
        if (folder == null || folder.isBlank()) return List.of();
        Path dir = Paths.get(imagesDir, folder); // D:\data_sach\<folder>
        if (!Files.isDirectory(dir)) return List.of();

        try (var s = Files.list(dir)) {
            return s.filter(Files::isRegularFile)
                    .map(p -> p.getFileName().toString())
                    .filter(fn -> fn.matches("(?i).+\\.(png|jpe?g|gif|webp)$"))
                    .sorted()
                    .map(fn -> "/images/" + folder.replace("\\","/") + "/" + fn)
                    .toList(); // nếu lỗi, xem mục 3 bên dưới
        } catch (IOException e) {
            return List.of();
        }
    }

    private static String getExt(String name) {
        int i = name.lastIndexOf('.');
        return i >= 0 ? name.substring(i+1).toLowerCase() : "";
    }
    private static String urlEncode(String s) {
        try {
            return URLEncoder.encode(s, StandardCharsets.UTF_8)
                             .replace("+", "%20");
        } catch (Exception e) { return s; }
    }
}