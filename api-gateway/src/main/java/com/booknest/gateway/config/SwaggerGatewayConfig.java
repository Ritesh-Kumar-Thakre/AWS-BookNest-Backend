package com.booknest.gateway.config;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.v3.oas.annotations.Hidden;

@RestController
@Hidden
public class SwaggerGatewayConfig {

    @GetMapping("/api/gateway/health")
    public String health() {
        return "Gateway is running";
    }
}
