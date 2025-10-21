package com.bookstore.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class WebConfig implements WebMvcConfigurer {

  @Value("${app.files.images-dir}")
  private String imagesDir;

  @Value("${app.files.public-prefix:/images}")
  private String publicPrefix;

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    String pattern = publicPrefix.endsWith("/**") ? publicPrefix : (publicPrefix.endsWith("/") ? publicPrefix + "**" : publicPrefix + "/**");
    // file:/app/data/images/
    String location = imagesDir.replace("\\", "/");
    if (!location.endsWith("/")) location += "/";
    registry.addResourceHandler(pattern)
            .addResourceLocations("file:" + location);
  }

  @Override
  public void addCorsMappings(CorsRegistry registry) {
    // (tuỳ chọn) – vì đã cấu hình Security CORS, có thể bỏ.
    registry.addMapping("/**")
            .allowedOriginPatterns("http://localhost:3000","http://localhost:5173","https://*.ngrok-free.app","https://your-frontend-domain.com")
            .allowedMethods("GET","POST","PUT","PATCH","DELETE","OPTIONS")
            .allowedHeaders("*")
            .exposedHeaders("Location","Content-Disposition")
            .allowCredentials(true);
  }
}
