import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../Controllers/paymentController.dart';

class ProductDetailsScreen1 extends StatelessWidget {
  const ProductDetailsScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final PaymentController paymentController = Get.put(PaymentController());

    return Scaffold(

      backgroundColor: Colors.white,
      bottomNavigationBar:  Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 2,
                  blurRadius: 4
              )
            ]
        ),
        height: 100,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Price',style: GoogleFonts.quicksand(color: Color(0xFF909090),fontWeight: FontWeight.w500),),
                    Text('Rs 22.65',style: GoogleFonts.quicksand(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),)

                  ],
                ),
              ),
              SizedBox(
                width: 152,
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFCC050),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: ()async {
                    // Assuming you have the amount and currency defined
                    String amount = "22.65"; //
                    String currency = "usd"; //

                    paymentController.paymentSheetInitialization(amount, currency);
                  },
                  child: Text(
                      'Pay Now',
                      style: GoogleFonts.quicksand(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w700)
                  ),
                ),
              ),

            ],
          ),
        ),

      ),
      body: SafeArea(
        child:  SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(

                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/productImg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.black,
                          onPressed: ()=> Get.back()
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.favorite_border),
                        color: Colors.black,
                        onPressed: () {
                          // Handle favorite press
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: screenHeight * 0.354,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IndicatorDot(isActive: true),
                    IndicatorDot(isActive: false),
                    IndicatorDot(isActive: false),
                  ],
                ),
              ),
              Padding(

                padding: EdgeInsets.only(top: screenHeight *0.4),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)
                    )
                  ),

                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Meatballs',
                                style: GoogleFonts.quicksand(fontSize: 24,fontWeight: FontWeight.w700,)
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: 4.9,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.red,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                    // Here you can save user rating to database/API
                                  },
                                ),
                                Text(' 4.9'),
                                Spacer(),
                                Icon(Icons.access_time, color: Color(0xFFFCC050)),
                                Text(' 10 - 15 min',style: GoogleFonts.quicksand(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.',
                                style: GoogleFonts.quicksand(fontWeight: FontWeight.w500,color: Color(0xFF909090))
                            ),



                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  final bool isActive;

  const IndicatorDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}