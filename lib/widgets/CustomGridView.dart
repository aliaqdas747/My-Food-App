

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/screens/home/productDetail.dart';

import 'ProductCard.dart';

class ProductGridView extends StatelessWidget {
  // Number of items in the grid
  final int itemCount = 20;

  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(10), // Padding around the grid
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 10, // Spacing between columns
        mainAxisSpacing: 10, // Spacing between rows
        childAspectRatio: 185 / 236, // Width / Height of each item
      ),
      itemCount: itemCount, // Total number of items
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: ()=> Get.to(()=> ProductDetailsScreen1()),
            child: ProductCard());
      },
    );
  }
}
