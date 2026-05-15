package com.booknest.review.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;

@Configuration
public class SwaggerConfig {

	@Bean
	public OpenAPI reviewServiceOpenAPI() {
		return new OpenAPI()
				.addServersItem(new io.swagger.v3.oas.models.servers.Server().url("http://localhost:8080/api/v1").description("API Gateway"))
				.info(new Info()
						.title("BookNest Review Service API")
						.description("Review Management APIs — Add, View, Update, Delete Book Reviews")
						.version("1.0.0")
						.contact(new Contact()
								.name("BookNest Team")
								.email("support@booknest.com")))
				.addSecurityItem(new SecurityRequirement().addList("Bearer Authentication"))
				.components(new Components()
						.addSecuritySchemes("Bearer Authentication",
								new SecurityScheme()
										.type(SecurityScheme.Type.HTTP)
										.bearerFormat("JWT")
										.scheme("bearer")));
	}
}
