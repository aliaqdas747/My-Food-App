import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfood/screens/auth/SignUpScreen.dart';
import 'package:myfood/screens/home/homeScreen.dart';
import '../../widgets/CustomEmailField.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),

              Center(
                child: Text(
                  'Reset Your Password',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF101828),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.10),
              CustomEmailField(label: 'Email', controller: emailController,),


              SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 48,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFEA900),
                  ),
                  onPressed: ()=> Get.offAll(()=> Homescreen()),
                  child: Text(
                    'Get Reset Link',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 14),
              SizedBox(height: screenHeight * 0.05),
              Image.asset('assets/images/applogo.png',height: 213,width: 185,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style: GoogleFonts.inter(),),
                  TextButton(onPressed: ()=> Get.to(()=> SignUpScreen()), child: Text('Sign Up',style: GoogleFonts.inter(fontWeight: FontWeight.bold),))
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
