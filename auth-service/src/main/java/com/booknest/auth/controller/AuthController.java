package com.booknest.auth.controller;

import java.nio.file.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.booknest.auth.dto.response.AuthResponse;
import com.booknest.auth.dto.response.UserResponse;
import com.booknest.auth.service.AuthService;
import com.booknest.auth.service.FileStorageService;
import com.booknest.user.entity.User;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/auth")
@Tag(name = "Authentication & User Management", description = "Endpoints for user registration, login, profile management, and role updates")
public class AuthController {

	@Autowired
	private AuthService authService;

	@Autowired
	private FileStorageService fileStorageService;

	@Operation(summary = "Register a new user", description = "Creates a new user account in the system")
	@PostMapping("/register")
	public ResponseEntity<AuthResponse> register(@RequestBody User user) {
		try {
			AuthResponse response = authService.register(user);
			return new ResponseEntity<>(response, HttpStatus.CREATED);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(new AuthResponse(null, e.getMessage()), HttpStatus.BAD_REQUEST);
		}
	}

	@Operation(summary = "User Login", description = "Authenticates a user and returns a JWT token")
	@PostMapping("/login")
	// HTTP request body directly do strings me bind nahi hoti so userd Map here
	public ResponseEntity<String> login(@RequestBody Map<String, String> request) {
		try {
			String email = request.get("email");
			String pass = request.get("password");

			String token = authService.login(email, pass);

			return new ResponseEntity<>(token, HttpStatus.OK);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}

	@Autowired
	private com.booknest.auth.service.GoogleOAuthService googleOAuthService;

	@Operation(summary = "Google OAuth Login", description = "Authenticates a user via Google ID Token")
	@PostMapping("/google")
	public ResponseEntity<AuthResponse> loginWithGoogle(@RequestBody Map<String, String> request) {
		try {
			String idToken = request.get("idToken");
			if (idToken == null || idToken.isEmpty()) {
				return new ResponseEntity<>(new AuthResponse(null, "Token is missing"), HttpStatus.BAD_REQUEST);
			}
			AuthResponse response = googleOAuthService.loginWithGoogle(idToken);
			return new ResponseEntity<>(response, HttpStatus.OK);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(new AuthResponse(null, e.getMessage()), HttpStatus.BAD_REQUEST);
		}
	}

	@Operation(summary = "Logout user", description = "Invalidates the user session (token-based logout logic)")
	@PostMapping("/logout")
	public ResponseEntity<?> logout(@RequestHeader(value = "Authorization", required = false) String authHeader) {
		if (authHeader != null && authHeader.startsWith("Bearer ")) {
			String token = authHeader.substring(7);
			authService.logout(token);
		}
		return ResponseEntity.ok(Map.of("message", "Logout Successful"));
	}

	@Operation(summary = "Refresh JWT Token", description = "Generates a new JWT token using an existing valid token")
	@PostMapping("/refresh")
	public ResponseEntity<String> refreshTken(@RequestHeader("Authorization") String authHeader) {
		try {
			String token = authHeader.substring(7);
			String newToken = authService.refreshToken(token);
			return ResponseEntity.ok(newToken);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}

	@Operation(summary = "Get user profile by ID", description = "Retrieves profile details for a specific user")
	@GetMapping("/getProfile/{userId}")
	public ResponseEntity<?> getProfile(@PathVariable Integer userId) {
		try {
			UserResponse user = authService.getProfile(userId);
			return new ResponseEntity<>(user, HttpStatus.OK);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
		}
	}

	@Operation(summary = "Get current logged-in user profile", description = "Uses X-User-Id header injected by Gateway to fetch profile")
	@GetMapping("/me")
	public ResponseEntity<?> getMyProfile(@RequestHeader(value = "X-User-Id", required = false) Integer userId) {
		if (userId == null) {
			return new ResponseEntity<>(java.util.Map.of("message", "User not logged in"), HttpStatus.UNAUTHORIZED);
		}
		try {
			UserResponse user = authService.getProfile(userId);
			return new ResponseEntity<>(user, HttpStatus.OK);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
		}
	}

	@Operation(summary = "Update user profile", description = "Updates details for the user")
	@PatchMapping("/update")
	public ResponseEntity<?> updateProfile(@RequestBody User user) {
		try {
			return new ResponseEntity<>(authService.update(user), HttpStatus.OK);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(java.util.Map.of("message", e.getMessage() != null ? e.getMessage() : "Update failed"), HttpStatus.NOT_FOUND);
		}
	}

	@Operation(summary = "Delete user account", description = "Permanently removes a user account")
	@DeleteMapping("/delete/{userId}")
	public ResponseEntity<?> deleteUser(@PathVariable Integer userId) {
		try {
			authService.deleteAccount(userId);
			return new ResponseEntity<>(java.util.Map.of("message", "User Deleted Succesfully"), HttpStatus.OK);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(java.util.Map.of("message", e.getMessage() != null ? e.getMessage() : "Delete failed"), HttpStatus.NOT_FOUND);
		}
	}

	@Operation(summary = "Change password", description = "Updates user password after verifying the old one")
	@PatchMapping("/change-password")
	public ResponseEntity<?> changePassword(@RequestBody Map<String, String> request) {
		try {
			Integer userId = Integer.parseInt(request.get("userId"));
			String oldPassword = request.get("oldPassword");
			String newPassword = request.get("newPassword");
			authService.changePassword(userId, oldPassword, newPassword);

			return new ResponseEntity<>(java.util.Map.of("message", "Password Changed Successfully"), HttpStatus.OK);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(java.util.Map.of("message", e.getMessage() != null ? e.getMessage() : "Password change failed"), HttpStatus.BAD_REQUEST);
		}
	}

	// Internal endpoint for notification-service to get user email
	@GetMapping("/internal/user/{userId}/email")
	public ResponseEntity<String> getEmailByUserId(@PathVariable Integer userId) {
		try {
			UserResponse user = authService.getProfile(userId);
			return new ResponseEntity<>(user.getEmail(), HttpStatus.OK);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
		}
	}

	// Internal endpoint for review-service to get user's full name
	@GetMapping("/internal/user/{userId}/name")
	public ResponseEntity<String> getNameByUserId(@PathVariable Integer userId) {
		try {
			UserResponse user = authService.getProfile(userId);
			return new ResponseEntity<>(user.getFullName(), HttpStatus.OK);
		} catch (RuntimeException e) {
			return new ResponseEntity<>("Unknown User", HttpStatus.OK);
		}
	}

	@Operation(summary = "Get all users", description = "Admin only: Retrieves a list of all registered users")
	@GetMapping("/users")
	public ResponseEntity<?> getAllUsers() {
		try {
			return new ResponseEntity<>(authService.getAllUsers(), HttpStatus.OK);
		} catch (RuntimeException e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}

	// ========================
	// Profile Image Upload
	// ========================

	@Operation(summary = "Upload profile image", description = "Uploads and updates the user's profile picture")
	@PostMapping("/upload-profile-image")
	public ResponseEntity<?> uploadProfileImage(
			@RequestHeader(value = "X-User-Id", required = false) Integer userId,
			@RequestParam("file") MultipartFile file) {
		if (userId == null) {
			return new ResponseEntity<>(Map.of("message", "User not logged in"), HttpStatus.UNAUTHORIZED);
		}
		try {
			String fileName = fileStorageService.storeFile(file);
			String imageUrl = "/auth/uploads/" + fileName;

			// Update user's profile image
			Optional<User> userOpt = authService.getUserByEmail(
					authService.getProfile(userId).getEmail());
			if (userOpt.isPresent()) {
				User user = userOpt.get();
				// Delete old profile image if exists
				if (user.getProfileImageUrl() != null && user.getProfileImageUrl().startsWith("/auth/uploads/")) {
					String oldFileName = user.getProfileImageUrl().replace("/auth/uploads/", "");
					fileStorageService.deleteFile(oldFileName);
				}
				user.setProfileImageUrl(imageUrl);
				authService.update(user);
			}

			return ResponseEntity.ok(Map.of("imageUrl", imageUrl));
		} catch (RuntimeException e) {
			return new ResponseEntity<>(Map.of("message", e.getMessage() != null ? e.getMessage() : "Upload failed"), HttpStatus.BAD_REQUEST);
		}
	}

	@GetMapping("/uploads/{fileName:.+}")
	public ResponseEntity<Resource> serveFile(@PathVariable String fileName) {
		try {
			Path filePath = fileStorageService.getFilePath(fileName);
			Resource resource = new UrlResource(filePath.toUri());
			if (resource.exists() && resource.isReadable()) {
				String contentType = "application/octet-stream";
				if (fileName.endsWith(".jpg") || fileName.endsWith(".jpeg")) contentType = "image/jpeg";
				else if (fileName.endsWith(".png")) contentType = "image/png";
				else if (fileName.endsWith(".gif")) contentType = "image/gif";
				else if (fileName.endsWith(".webp")) contentType = "image/webp";

				return ResponseEntity.ok()
						.contentType(MediaType.parseMediaType(contentType))
						.header(HttpHeaders.CACHE_CONTROL, "max-age=86400")
						.body(resource);
			}
			return ResponseEntity.notFound().build();
		} catch (Exception e) {
			return ResponseEntity.notFound().build();
		}
	}

	@PatchMapping("/change-role/{userId}")
	public ResponseEntity<?> changeRole(@PathVariable Integer userId, @RequestParam String role) {
		try {
			authService.changeRole(userId, role);
			return ResponseEntity.ok(Map.of("message", "Role updated successfully to " + role));
		} catch (RuntimeException e) {
			return new ResponseEntity<>(Map.of("message", e.getMessage()), HttpStatus.BAD_REQUEST);
		}
	}
}