package com.cg.wallet.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.bind.annotation.RequestHeader;
import java.util.Map;
import com.cg.wallet.entity.Wallet;

import com.cg.wallet.repository.WalletRepository;
import com.cg.wallet.service.WalletService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/wallet")
@RequiredArgsConstructor
@Tag(name = "Wallet Management", description = "Endpoints for managing user wallets, adding funds, and viewing transaction statements")
public class WalletController {

	private final WalletService walletService;
	private final WalletRepository walletRepository;

	@Operation(summary = "Get all wallets", description = "Admin only: Retrieves a list of all user wallets in the system")
	@GetMapping("/all")
	public ResponseEntity<?> getWallets() {

		return new ResponseEntity<>(

				walletService.getWallets(),

				HttpStatus.OK

		);

	}

	@Operation(summary = "Add a new wallet", description = "Creates a new wallet for a user")
	@PostMapping("/add")
	public ResponseEntity<?> addWallet(

			@RequestBody Wallet wallet

	) {

		return new ResponseEntity<>(

				walletService.addWallet(wallet),

				HttpStatus.CREATED

		);

	}

	@Operation(summary = "Add money to wallet", description = "Adds a specific amount to a wallet with remarks")
	@PutMapping("/addmoney/{walletId}")
	public ResponseEntity<?> addMoney(

			@PathVariable Integer walletId,

			@RequestParam Double amount,

			@RequestParam String remarks

	) {

		Wallet wallet = walletService.getById(walletId);

		walletService.addMoney(wallet, amount, remarks);

		return ResponseEntity.ok().body(java.util.Map.of("message", "Money added successfully"));

	}

	@PutMapping("/update/{walletId}")
	public ResponseEntity<?> update(

			@PathVariable Integer walletId,

			@RequestParam Double amount,

			@RequestParam String remarks,

			@RequestParam Integer orderId

	) {

		Wallet wallet = walletService.getById(walletId);

		walletService.update(wallet, amount, remarks, orderId);

		return new ResponseEntity<>(HttpStatus.OK);

	}

	@GetMapping("/{walletId}")
	public ResponseEntity<?> getById(

			@PathVariable Integer walletId

	) {

		return new ResponseEntity<>(

				walletService.getById(walletId),

				HttpStatus.OK

		);

	}

	@Operation(summary = "Get wallet statement", description = "Retrieves the transaction history for a specific wallet")
	@GetMapping("/statement/{walletId}")
	public ResponseEntity<?> statementsById(

			@PathVariable Integer walletId

	) {

		return new ResponseEntity<>(

				walletService.getStatementsById(walletId),

				HttpStatus.OK

		);

	}

	@GetMapping("/statement")
	public ResponseEntity<?> statements() {

		return new ResponseEntity<>(

				walletService.getStatements(),

				HttpStatus.OK

		);

	}

	@DeleteMapping("/{walletId}")
	public ResponseEntity<?> delete(

			@PathVariable Integer walletId

	) {

		walletService.deleteById(walletId);

		return new ResponseEntity<>(HttpStatus.OK);

	}

	@PutMapping("/withdraw/{walletId}")
	public ResponseEntity<?> withdrawMoney(
			@PathVariable Integer walletId,
			@RequestParam Double amount,
			@RequestParam String remarks) {
		try {
			if (amount == null || amount < 1) {
				return ResponseEntity.badRequest().body(java.util.Map.of("message", "Amount must be at least ₹1"));
			}
			Wallet wallet = walletService.getById(walletId);
			walletService.withdraw(wallet, amount, remarks);
			return ResponseEntity.ok().body(java.util.Map.of("message", "Withdrawal successful"));
		} catch (RuntimeException e) {
			return ResponseEntity.badRequest().body(java.util.Map.of("message", e.getMessage()));
		}
	}

	@Operation(summary = "Get current user balance", description = "Retrieves the current wallet balance for the logged-in user")
	@GetMapping("/balance")
	public ResponseEntity<?> getBalance(@RequestHeader(value = "X-User-Id", required = false) Integer userId) {
		if (userId == null) {
			return new ResponseEntity<>(java.util.Map.of("message", "User not logged in"), HttpStatus.UNAUTHORIZED);
		}
		Double balance = walletRepository.findByUserId(userId)
				.map(Wallet::getCurrentBalance)
				.orElse(0.0);
		return ResponseEntity.ok(Map.of("balance", balance));
	}

	@GetMapping("/me")
	public ResponseEntity<?> getMyWallet(@RequestHeader(value = "X-User-Id", required = false) Integer userId) {
		if (userId == null) {
			return new ResponseEntity<>(java.util.Map.of("message", "User not logged in"), HttpStatus.UNAUTHORIZED);
		}
		Wallet wallet = walletRepository.findByUserId(userId)
				.orElseThrow(() -> new RuntimeException("Wallet not found"));
		return ResponseEntity.ok(wallet);
	}

	@Operation(summary = "Pay money from wallet", description = "Internal: Deducts money from wallet for an order payment")
	@PutMapping("/pay")
	public ResponseEntity<Map<String, Boolean>> payMoney(
			@RequestHeader("X-User-Id") Integer userId,
			@RequestParam Double amount,
			@RequestParam Integer orderId) {
		Wallet wallet = walletRepository.findByUserId(userId)
				.orElseThrow(() -> new RuntimeException("Wallet not found"));

		walletService.update(wallet, amount, "Order payment", orderId);

		return ResponseEntity.ok(Map.of("success", true));
	}

	@PutMapping("/refund")
	public ResponseEntity<Map<String, Boolean>> refundMoney(
			@RequestHeader("X-User-Id") Integer userId,
			@RequestParam Double amount,
			@RequestParam Integer orderId) {
		Wallet wallet = walletRepository.findByUserId(userId)
				.orElseThrow(() -> new RuntimeException("Wallet not found"));

		walletService.refund(wallet, amount, "Order cancellation refund", orderId);

		return ResponseEntity.ok(Map.of("success", true));
	}
}