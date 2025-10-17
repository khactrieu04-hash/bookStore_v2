// ImageBrowseAPI.java
package com.bookstore.api;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.*;
import java.util.stream.*;

@RestController
@RequestMapping("/api/public")
@RequiredArgsConstructor
public class ImageBrowseAPI {

    @Value("${app.files.images-dir}")
    private String imagesDir;

    @GetMapping("/images-from-folder")
    public Map<String, Object> listImages(@RequestParam("folder") String folder) throws IOException {
        // folder là thư mục con bên trong D:\data_sach (VD: "tiểu thuyết" hoặc "tieu-thuyet/bo1")
        if (!StringUtils.hasText(folder)) {
            throw new IllegalArgumentException("folder is required");
        }

        Path root = Paths.get(imagesDir).normalize().toAbsolutePath();
        Path dir  = root.resolve(folder).normalize();

        // chống truy cập thoát ra ngoài root
        if (!dir.startsWith(root)) {
            throw new IllegalArgumentException("Invalid folder: " + folder);
        }
        if (!Files.exists(dir) || !Files.isDirectory(dir)) {
            throw new IllegalArgumentException("Folder not found: " + dir);
        }

        // lọc các file ảnh thường gặp
        List<String> exts = List.of(".jpg", ".jpeg", ".png", ".webp", ".gif");
        try (Stream<Path> stream = Files.list(dir)) {
            List<String> images = stream
                .filter(Files::isRegularFile)
                .filter(p -> {
                    String name = p.getFileName().toString().toLowerCase(Locale.ROOT);
                    return exts.stream().anyMatch(name::endsWith);
                })
                .sorted()
                .map(p -> {
                    // build URL public: /images/<folder>/<file>
                    String rel = root.relativize(p).toString().replace("\\", "/");
                    // URL-encode từng segment để hỗ trợ dấu cách, tiếng Việt
                    String[] segments = rel.split("/");
                    String encoded = Arrays.stream(segments)
                            .map(s -> UriUtils.encodePathSegment(s, StandardCharsets.UTF_8))
                            .collect(Collectors.joining("/"));
                    return "/images/" + encoded;
                })
                .toList();

            Map<String, Object> out = new LinkedHashMap<>();
            out.put("folder", folder);
            out.put("count", images.size());
            out.put("images", images);
            return out;
        }
    }
}
