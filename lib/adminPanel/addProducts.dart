import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/ProductController.dart';

class ProductsAddScreen extends StatelessWidget {
  final ProductsController controller = Get.put(ProductsController());

  ProductsAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Product Name TextField
            TextField(
              onChanged: (value) => controller.productName.value = value,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Description TextField
            TextField(
              onChanged: (value) => controller.description.value = value,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Price TextField
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) => controller.price.value = value,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Save and Cancel Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    child: const Text('Cancel', style: TextStyle(color: Colors.red)),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: controller.saveProductInfo,
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
