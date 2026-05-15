package com.booknest.book.security.filter;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Legacy JWT filter for the Book Service.
 *
 * NOTE: JWT validation is now handled centrally by the API Gateway's
 * JwtAuthFilter. This filter simply passes all requests through.
 * The InternalSecurityFilter handles service-level access control instead.
 *
 * This class is kept to satisfy the SecurityConfig dependency but performs
 * no authentication logic.
 */
@Component
public class JwtFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {

		// No-op: The API Gateway validates the JWT and injects
		// X-User-Id / X-User-Role headers before the request reaches here.
		filterChain.doFilter(request, response);
	}
}