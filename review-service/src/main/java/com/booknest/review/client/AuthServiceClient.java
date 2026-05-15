package com.booknest.review.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "auth-Service", url = "${feign.auth-service.url:}")
public interface AuthServiceClient {

	@GetMapping("/auth/internal/user/{userId}/name")
	String getNameByUserId(@PathVariable Integer userId);
}
