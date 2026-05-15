package com.cg.order.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cg.order.dto.request.OnlinePaymentRequest;
import com.cg.order.dto.request.PlaceOrderRequest;
import com.cg.order.dto.request.UpdateOrderStatusRequest;
import com.cg.order.service.OrderService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/orders")
@RequiredArgsConstructor
@Tag(name = "Order Management", description = "Endpoints for placing orders, handling payments, and tracking order status")
public class OrderController {

	private final OrderService orderService;

	@Operation(summary = "Get all orders", description = "Admin only: Retrieves a list of all orders in the system")
	@GetMapping
	public ResponseEntity<?> getAll() {
		return ResponseEntity.ok(orderService.getAllOrders());
	}

	@Operation(summary = "Get order by ID", description = "Retrieves details of a specific order by its ID")
	@GetMapping("/{id}")
	public ResponseEntity<?> getById(@PathVariable int id) {
		return ResponseEntity.ok(orderService.getOrderById(id));
	}

	@Operation(summary = "Get orders by User ID", description = "Retrieves all orders placed by a specific user")
	@GetMapping("/user/{userId}")
	public ResponseEntity<?> getByUser(@PathVariable int userId) {
		return ResponseEntity.ok(orderService.getOrderByUserId(userId));
	}

	@Operation(summary = "Place a new order", description = "Creates a new order (COD or Wallet)")
	@PostMapping("/place")
	public ResponseEntity<?> place(@RequestBody PlaceOrderRequest req) {
		try {
			return new ResponseEntity<>(orderService.placeOrder(req), HttpStatus.CREATED);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(java.util.Map.of("message", e.getMessage() != null ? e.getMessage() : "Failed to place order"), HttpStatus.BAD_REQUEST);
		}
	}

	@Operation(summary = "Process online payment", description = "Handles online payment for an order")
	@PostMapping("/online")
	public ResponseEntity<?> online(@RequestBody OnlinePaymentRequest req) {
		try {
			return ResponseEntity.ok(orderService.onlinePayment(req));
		} catch (RuntimeException e) {
			return new ResponseEntity<>(java.util.Map.of("message", e.getMessage() != null ? e.getMessage() : "Payment failed"), HttpStatus.BAD_REQUEST);
		}
	}

	@Operation(summary = "Update order status", description = "Admin only: Changes the status of an order (e.g., SHIPPED, DELIVERED)")
	@PutMapping("/status")
	public ResponseEntity<?> status(@RequestBody UpdateOrderStatusRequest req) {
		try {
			return ResponseEntity.ok(orderService.changeStatus(req));
		} catch (Exception e) {
			return new ResponseEntity<>(java.util.Map.of("message", e.getMessage() != null ? e.getMessage() : "Failed to update status"), HttpStatus.BAD_REQUEST);
		}
	}

	@Operation(summary = "Delete order", description = "Admin only: Deletes an order from the system")
	@DeleteMapping("/{id}")
	public ResponseEntity<?> delete(@PathVariable int id) {
		orderService.deleteOrder(id);
		return ResponseEntity.ok("Deleted");
	}
}