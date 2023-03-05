package com.ltw.online_store.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/template/css/");
        registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/template/js/");
        registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/template/img/");
        registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/template/fonts/");
        registry.addResourceHandler("/view/**").addResourceLocations("/WEB-INF/view/");

    }
}
