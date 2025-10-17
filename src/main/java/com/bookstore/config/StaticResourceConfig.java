package com.bookstore.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Path;
import java.nio.file.Paths;

@Configuration
public class StaticResourceConfig implements WebMvcConfigurer {
  @Value("${app.files.images-dir}") private String imagesDir;

  @Override public void addResourceHandlers(ResourceHandlerRegistry registry) {
    String location = Paths.get(imagesDir).toUri().toString();
    if (!location.endsWith("/")) location += "/";
    registry.addResourceHandler("/images/**").addResourceLocations(location);
  }
}

