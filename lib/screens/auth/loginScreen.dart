import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfood/Controllers/login_controller.dart';
import 'package:myfood/screens/auth/SignUpScreen.dart';
import 'package:myfood/screens/auth/forget_password_screen.dart';
import 'package:myfood/utils/Constants/AppColors.dart';
 

import '../../widgets/CustomEmailField.dart';
import '../../widgets/CustomPswrdField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController authController = Get.put(LoginController());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
                  'Welcome Back!',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF101828),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.10),
              CustomEmailField(label: 'Email', controller: emailController,),
              SizedBox(height: 12),
              PasswordField(
                textFieldController: passwordController,
                hintText: 'Password', isPassword: true,),
              SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 48,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {
print('Sign in');
                    authController.login(emailController.text, passwordController.text);

                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ), 
              ),
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.green,
                          shape: CircleBorder(),
                          value: true, // Set your value here
                          onChanged: (bool? value) {
                            // Handle checkbox state change
                          },
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(color: Color(0xFF667085)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: ()=> Get.to(()=> ForgetPasswordScreen()),
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                              color: Color(0xFF435A39),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
