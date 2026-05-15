package com.booknest.wishlist.controller;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.booknest.wishlist.dto.request.AddWishlistRequest;
import com.booknest.wishlist.service.WishlistService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/wishlist")
@RequiredArgsConstructor
@Tag(name = "Wishlist Management", description = "Endpoints for managing user wishlists and moving items to cart")
public class WishlistController {

	private final WishlistService wishlistService;

	@Operation(summary = "Add to wishlist", description = "Adds a book to the user's wishlist")
	@PostMapping
	public ResponseEntity<?> add(@RequestHeader("X-User-Id") Integer userId,
			@RequestBody AddWishlistRequest request) {
		try {
			return new ResponseEntity<>(wishlistService.addToWishlist(userId, request), HttpStatus.CREATED);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(java.util.Map.of("message", e.getMessage() != null ? e.getMessage() : "Failed to add to wishlist"), HttpStatus.BAD_REQUEST);
		}
	}

	@Operation(summary = "Remove from wishlist", description = "Removes a specific book from the user's wishlist")
	@DeleteMapping("/{bookId}")
	public ResponseEntity<?> remove(@RequestHeader("X-User-Id") Integer userId,
			@PathVariable Integer bookId) {
		try {
			wishlistService.removeFromWishlist(userId, bookId);
			return ResponseEntity.ok(java.util.Map.of("message", "Removed from wishlist"));
		} catch (RuntimeException e) {
			return new ResponseEntity<>(java.util.Map.of("message", e.getMessage() != null ? e.getMessage() : "Failed to remove from wishlist"), HttpStatus.NOT_FOUND);
		}
	}

	@Operation(summary = "Get user wishlist", description = "Retrieves a paginated list of books in the user's wishlist")
	@GetMapping
	public ResponseEntity<?> getAll(@RequestHeader("X-User-Id") Integer userId,
			@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "10") int size) {
		Pageable pageable = PageRequest.of(page, size);
		return ResponseEntity.ok(wishlistService.getWishlist(userId, pageable));
	}

	@Operation(summary = "Check wishlist status", description = "Checks if a specific book is already in the user's wishlist")
	@GetMapping("/check/{bookId}")
	public ResponseEntity<?> check(@RequestHeader("X-User-Id") Integer userId,
			@PathVariable Integer bookId) {
		return ResponseEntity.ok(wishlistService.isInWishlist(userId, bookId));
	}

	@Operation(summary = "Move to cart", description = "Moves a specific wishlist item to the user's shopping cart")
	@PostMapping("/move-to-cart/{itemId}")
	public ResponseEntity<?> moveToCart(@RequestHeader("X-User-Id") Integer userId,
			@PathVariable Integer itemId) {
		try {
			return ResponseEntity.ok(wishlistService.moveToCart(userId, itemId));
		} catch (RuntimeException e) {
			return new ResponseEntity<>(java.util.Map.of("message", e.getMessage() != null ? e.getMessage() : "Failed to move to cart"), HttpStatus.BAD_REQUEST);
		}
	}
}
