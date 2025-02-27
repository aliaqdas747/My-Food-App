import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  var isLoading = false.obs;
  var intentPaymentData;

  // Stripe Secret Key (Move this to a secure location)
  final String _secretKey = "sk_test_51QZ6mLJzQK1lunsESijH0ok4lUFpj8QaqgckwhGmmnIYPyYFWV4eJKOBXYvKbkufVXrlbGwyQKK18ksgyQ2d5NH400oZ1uGjyU";

  /// **Show Payment Sheet**
  Future<void> showPaymentSheet() async {
    try {
      isLoading.value = true;
      await Stripe.instance.presentPaymentSheet();
      isLoading.value = false;

      Get.snackbar('Payment Success', 'Your Payment was successful!');
    } on StripeException catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print("Stripe error: ${e.error.localizedMessage}");
      }
      Get.defaultDialog(
        title: "Payment Error",
        content: Text(e.error.localizedMessage ?? "Payment was cancelled."),
      );
    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print("Unexpected error: $e");
      }
      Get.defaultDialog(
        title: "Unexpected Error",
        content: const Text("An unexpected error occurred during payment."),
      );
    }
  }

  /// **Create Payment Intent**
  Future<Map<String, dynamic>?> makeIntentForPayment(String amount, String currency) async {
    try {
      double amountDouble = double.tryParse(amount) ?? 0.0;
      int amountInCents = (amountDouble * 100).toInt();

      if (amountInCents <= 0) {
        throw "Invalid amount for payment";
      }

      var response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        headers: {
          "Authorization": "Bearer $_secretKey",
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "amount": amountInCents.toString(),
          "currency": currency,
          "payment_method_types[]": "card",
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Stripe API Error: ${response.statusCode}, ${response.body}");
        Get.snackbar("Payment Error", "Failed to create payment intent. Please try again.");
        return null;
      }
    } catch (e) {
      print("Error creating payment intent: $e");
      Get.snackbar("Payment Error", "An error occurred. Please try again.");
      return null;
    }
  }

  /// **Initialize Payment Sheet**
  Future<void> paymentSheetInitialization(String amount, String currency) async {
    try {
      intentPaymentData = await makeIntentForPayment(amount, currency);

      if (intentPaymentData == null) {
        Get.snackbar("Payment Error", "Failed to initialize payment. Please try again.");
        return;
      }

      isLoading.value = true;

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          allowsDelayedPaymentMethods: true,
          paymentIntentClientSecret: intentPaymentData["client_secret"],
          style: ThemeMode.light,
          merchantDisplayName: "Tippys Pizza",
        ),
      );

      isLoading.value = false;
      await showPaymentSheet();
    } catch (e, s) {
      isLoading.value = false;
      if (kDebugMode) {
        print("Error initializing payment sheet: $e\n$s");
      }
      Get.snackbar("Payment Error", "Failed to initialize payment. Please try again.");
    }
  }
}
