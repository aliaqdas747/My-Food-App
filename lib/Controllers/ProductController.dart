import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  // Reactive variables for product details
  var productName = ''.obs;
  var description = ''.obs;
  var price = ''.obs;

  // Method to save product information to Firestore
  Future<void> saveProductInfo() async {
    if (productName.isEmpty || description.isEmpty || price.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      // Save product details to Firestore
      await FirebaseFirestore.instance.collection('products').add({
        'name': productName.value,
        'description': description.value,
        'price': double.parse(price.value), // Convert price to double
        'createdAt': FieldValue.serverTimestamp(), // Add timestamp
      });

      // Clear fields after saving
      productName.value = '';
      description.value = '';
      price.value = '';

      Get.snackbar(
        'Success',
        'Product saved successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print('$e');
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
