package com.booknest.notification.controller;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.booknest.notification.dto.request.CreateNotificationRequest;
import com.booknest.notification.service.NotificationService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/notifications")
@RequiredArgsConstructor
@Tag(name = "Notification Management", description = "Endpoints for creating, viewing, and managing user notifications and alerts")
public class NotificationController {

	private final NotificationService notificationService;

	// Internal — called by other services
	@Operation(summary = "Create notification", description = "Internal: Creates a new notification for a user (e.g., order updates, balance alerts)")
	@PostMapping
	public ResponseEntity<?> create(@RequestBody CreateNotificationRequest request) {
		try {
			return new ResponseEntity<>(notificationService.create(request), HttpStatus.CREATED);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}

	@Operation(summary = "Get user notifications", description = "Retrieves a paginated list of notifications for the logged-in user")
	@GetMapping
	public ResponseEntity<?> getByUser(@RequestHeader("X-User-Id") Integer userId,
			@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "10") int size) {
		Pageable pageable = PageRequest.of(page, size);
		return ResponseEntity.ok(notificationService.getByUser(userId, pageable));
	}

	@Operation(summary = "Get unread count", description = "Returns the number of unread notifications for the user")
	@GetMapping("/unread-count")
	public ResponseEntity<?> getUnreadCount(@RequestHeader("X-User-Id") Integer userId) {
		return ResponseEntity.ok(notificationService.getUnreadCount(userId));
	}

	@PutMapping("/read/{notificationId}")
	public ResponseEntity<?> markAsRead(@PathVariable Integer notificationId) {
		try {
			notificationService.markAsRead(notificationId);
			return ResponseEntity.ok("Marked as read");
		} catch (RuntimeException e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
		}
	}

	@PutMapping("/read-all")
	public ResponseEntity<?> markAllAsRead(@RequestHeader("X-User-Id") Integer userId) {
		notificationService.markAllAsRead(userId);
		return ResponseEntity.ok("All marked as read");
	}

	@DeleteMapping("/{notificationId}")
	public ResponseEntity<?> delete(@PathVariable Integer notificationId) {
		try {
			notificationService.delete(notificationId);
			return ResponseEntity.ok("Deleted");
		} catch (RuntimeException e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
		}
	}
}
