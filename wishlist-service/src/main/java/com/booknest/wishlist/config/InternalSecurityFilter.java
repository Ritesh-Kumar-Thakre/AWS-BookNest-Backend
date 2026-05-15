package com.booknest.wishlist.config;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * Blocks direct access to this microservice.
 * Only requests from the API Gateway (with X-Internal-Secret header) are allowed.
 */
@Component
@Order(1)
public class InternalSecurityFilter implements Filter {

    @Value("${internal.security.secret:BookNest_Internal_Secret_2024}")
    private String internalSecret;

    @Value("${internal.security.header:X-Internal-Secret}")
    private String internalHeader;

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String path = request.getRequestURI().toLowerCase();

        if (path.contains("/swagger-ui") || path.contains("/v3/api-docs") || path.contains("/actuator")) {
            chain.doFilter(req, res);
            return;
        }

        String secret = request.getHeader(internalHeader);

        if (!internalSecret.equals(secret)) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            response.setContentType("application/json");
            response.getWriter().write(
                    "{\"error\":\"Access denied. Direct access is not allowed. Use the API Gateway (port 8080).\"}"
            );
            return;
        }

        chain.doFilter(req, res);
    }
}
