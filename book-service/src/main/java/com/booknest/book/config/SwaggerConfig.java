package com.booknest.book.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {

	@Bean
	public OpenAPI bookServiceOpenAPI() {
		return new OpenAPI()
				.addServersItem(new io.swagger.v3.oas.models.servers.Server().url("http://localhost:8080/api/v1").description("API Gateway"))
				.info(new Info()
						.title("BookNest Book Service API")
						.description("Book Management APIs — CRUD, Search, Genre, Stock, Rating, Image Upload")
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
