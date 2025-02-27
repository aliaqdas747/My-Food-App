import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../Controllers/login_controller.dart';
import '../../widgets/CustomGridView.dart';



class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String name = box.read('name') ?? 'food lover';
    final LoginController loginController = Get.put(LoginController());
    double screeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){
                    loginController.logout();
                  }, icon: Icon(Iconsax.logout)),
                ],
              ),
              SizedBox(height: screeHeight * 0.10),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'Hi $name!',
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2E3E5C),
                  ),
                ),
              ),
              SizedBox(height: screeHeight * 0.02),
              Text(
                'Popular Now',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2E3E5C),
                ),
              ),
              SizedBox(height: 10),
              Expanded( // Use Expanded here
                child: ProductGridView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

