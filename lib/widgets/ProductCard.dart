import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 236, // Height of each container
      width: 185, // Width of each container
      decoration: BoxDecoration(
        color: Color(0xFFF1F6FB), // Background color of the container
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Center(child: Image(image: AssetImage('assets/images/burger.png',),height: 130,width: 142,)),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scobedo Burger',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2E3E5C),
                    ),
                  ),
                  Text(
                    'Cibadak Market',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2E3E5C),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rs 12',
                        style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFCC050)

                        ),
                      ),
                      Gap(Checkbox.width),
                      Gap(Checkbox.width),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 48,width: 48,
                        decoration: BoxDecoration(
                            color: Color(0xFFFCC050),
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child:IconButton(onPressed: (){}, icon: Icon(Iconsax.shopping_bag,color: Colors.white,)) ,
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}