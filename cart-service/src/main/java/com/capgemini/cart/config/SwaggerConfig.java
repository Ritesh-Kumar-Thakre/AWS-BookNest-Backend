package com.capgemini.cart.config;

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
	public OpenAPI cartServiceOpenAPI() {
		return new OpenAPI()
				.addServersItem(new io.swagger.v3.oas.models.servers.Server().url("http://localhost:8080/api/v1").description("API Gateway"))
				.info(new Info()
						.title("BookNest Cart Service API")
						.description("Shopping Cart APIs — Add, Remove, View, Clear Cart Items")
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
