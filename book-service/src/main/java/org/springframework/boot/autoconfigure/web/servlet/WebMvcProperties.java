package org.springframework.boot.autoconfigure.web.servlet;

/**
 * Polyfill to satisfy springdoc-openapi introspection in Spring Boot 4.x.
 * Spring Boot 4 relocated or removed this class, causing NoClassDefFoundError
 * when springdoc tries to introspect SwaggerConfig.
 */
public class WebMvcProperties {
    // Empty dummy class
}
