// src/main/java/com/bookstore/config/CorsConfig.java
package com.bookstore.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class CorsConfig implements WebMvcConfigurer {
  @Override
  public void addCorsMappings(CorsRegistry registry) {
    registry.addMapping("/**")
        // Nếu cần wildcard subdomain (ngrok, vercel...), dùng allowedOriginPatterns:
        .allowedOriginPatterns(
            "http://localhost:3000",
            "http://localhost:5173",
            "https://*.ngrok-free.app",
            "https://your-frontend-domain.com"
        )
        .allowedMethods("GET","POST","PUT","PATCH","DELETE","OPTIONS")
        .allowedHeaders("*")
        .exposedHeaders("Location","Content-Disposition")
        .allowCredentials(true)   // đừng bật với allowedOrigins="*"
        .maxAge(3600);
  }
}
