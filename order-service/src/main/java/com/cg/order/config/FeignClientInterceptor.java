package com.cg.order.config;

import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * Automatically adds the X-Internal-Secret header to all outgoing
 * Feign client calls (e.g., order-service → book-service).
 * This ensures inter-service communication is not blocked by the
 * InternalSecurityFilter on the target service.
 */
@Configuration
public class FeignClientInterceptor implements RequestInterceptor {

    @Value("${internal.security.secret:BookNest_Internal_Secret_2024}")
    private String internalSecret;

    @Value("${internal.security.header:X-Internal-Secret}")
    private String internalHeader;

    @Override
    public void apply(RequestTemplate template) {
        template.header(internalHeader, internalSecret);
    }
}
