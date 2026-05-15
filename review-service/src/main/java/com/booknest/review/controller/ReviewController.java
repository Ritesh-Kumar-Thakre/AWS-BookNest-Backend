package com.booknest.review.controller;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.booknest.review.dto.request.AddReviewRequest;
import com.booknest.review.service.ReviewService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/reviews")
@RequiredArgsConstructor
@Tag(name = "Review Management", description = "Endpoints for adding, viewing, and moderating book reviews and ratings")
public class ReviewController {

	private final ReviewService reviewService;

	@Operation(summary = "Add a new review", description = "Allows a user to post a rating and comment for a book")
	@PostMapping
	public ResponseEntity<?> addReview(@RequestBody AddReviewRequest request) {
		try {
			return new ResponseEntity<>(reviewService.addReview(request), HttpStatus.CREATED);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(java.util.Map.of("message", e.getMessage() != null ? e.getMessage() : "Failed to add review"), HttpStatus.BAD_REQUEST);
		}
	}

	@Operation(summary = "Get reviews by book", description = "Retrieves a paginated list of reviews for a specific book")
	@GetMapping("/book/{bookId}")
	public ResponseEntity<?> getByBook(@PathVariable Integer bookId,
			@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "10") int size) {
		Pageable pageable = PageRequest.of(page, size);
		return ResponseEntity.ok(reviewService.getReviewsByBook(bookId, pageable));
	}

	@Operation(summary = "Get reviews by user", description = "Retrieves all reviews posted by a specific user")
	@GetMapping("/user/{userId}")
	public ResponseEntity<?> getByUser(@PathVariable Integer userId) {
		return ResponseEntity.ok(reviewService.getReviewsByUser(userId));
	}

	@Operation(summary = "Get average rating", description = "Calculates and returns the average rating for a specific book")
	@GetMapping("/average/{bookId}")
	public ResponseEntity<?> getAverage(@PathVariable Integer bookId) {
		return ResponseEntity.ok(reviewService.getAverageRating(bookId));
	}

	@Operation(summary = "Update review", description = "Updates the rating and comment of an existing review")
	@PutMapping("/{reviewId}")
	public ResponseEntity<?> update(@PathVariable Integer reviewId, @RequestBody AddReviewRequest request) {
		try {
			return ResponseEntity.ok(reviewService.updateReview(reviewId, request));
		} catch (RuntimeException e) {
			return new ResponseEntity<>(java.util.Map.of("message", e.getMessage() != null ? e.getMessage() : "Failed to update review"), HttpStatus.BAD_REQUEST);
		}
	}

	@Operation(summary = "Delete review", description = "Removes a specific review from the system")
	@DeleteMapping("/{reviewId}")
	public ResponseEntity<?> delete(@PathVariable Integer reviewId) {
		try {
			reviewService.deleteReview(reviewId);
			return ResponseEntity.ok(java.util.Map.of("message", "Review deleted"));
		} catch (RuntimeException e) {
			return new ResponseEntity<>(java.util.Map.of("message", e.getMessage() != null ? e.getMessage() : "Failed to delete review"), HttpStatus.NOT_FOUND);
		}
	}

	@Operation(summary = "Get all reviews", description = "Admin only: Retrieves a paginated list of all reviews")
	@GetMapping
	public ResponseEntity<?> getAll(
			@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "10") int size) {
		Pageable pageable = PageRequest.of(page, size);
		return ResponseEntity.ok(reviewService.getAllReviews(pageable));
	}

	@Operation(summary = "Moderate review", description = "Admin only: Updates the status of a review (e.g., APPROVED, REJECTED)")
	@PutMapping("/{reviewId}/status")
	public ResponseEntity<?> moderate(@PathVariable Integer reviewId, @RequestParam String status) {
		try {
			return ResponseEntity.ok(reviewService.moderateReview(reviewId, status));
		} catch (RuntimeException e) {
			return new ResponseEntity<>(java.util.Map.of("message", e.getMessage() != null ? e.getMessage() : "Failed to moderate review"), HttpStatus.BAD_REQUEST);
		}
	}
}
