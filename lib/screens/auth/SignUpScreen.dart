import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfood/screens/auth/loginScreen.dart';

import '../../Controllers/SignUp_controller.dart';
import '../../utils/Constants/AppColors.dart';
import '../../widgets/CustomEmailField.dart';
import '../../widgets/CustomPswrdField.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final SignUpController signUpController = Get.put(SignUpController());
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:  AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),

              Center(
                child: Text(
                  'Create Account',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF101828),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.10),
              CustomEmailField(label: 'Name', controller: nameController),
              const SizedBox(height: 12),
              CustomEmailField(label: 'Email', controller: emailController),
              const SizedBox(height: 12),

              PasswordField(
                textFieldController: passwordController,
                hintText: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:   AppColors.primaryColor,
                  ),
                  onPressed: () {
                    String name = nameController.text.trim();
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                    box.write('name', 'John Doe');
                    signUpController.SignUp(name, email, password);
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 14, color: AppColors.backgroundColor,),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.05),
              Image.asset('assets/images/applogo.png', height: 213, width: 185),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an Account?", style: GoogleFonts.inter()),
                  TextButton(
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: Text(
                      'Login',
                      style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}