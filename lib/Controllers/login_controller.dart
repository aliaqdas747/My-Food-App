import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myfood/screens/auth/loginScreen.dart';
import 'package:myfood/screens/home/homeScreen.dart';
import 'package:myfood/utils/Constants/AppColors.dart';

class LoginController extends GetxController{
  FirebaseAuth auth = FirebaseAuth.instance;
// tracks user login status, observable for change detection.
  var isloggedIn = false.obs;

  //Check the user already loggedIn or not
  @override
void onReady(){
    super.onReady();
    auth.authStateChanges().listen((User? user){
      if(user == null){
         isloggedIn.value = false;
      }else{
        isloggedIn.value = true;
        Get.offAll(()=> Homescreen());
      }
    });
  }


  Future<void> login(String email, String password) async {
  try {
  await auth.signInWithEmailAndPassword(email: email, password: password);
  Get.snackbar("Success", "Login Successful", backgroundColor: AppColors.primaryColor);
  } on FirebaseAuthException catch (e) {
  String errorMessage = getErrorMessage(e.code);
  Get.snackbar("Login Failed", errorMessage, backgroundColor: AppColors.primaryColor);
  } catch (e) {
    print(e.toString());
  Get.snackbar("Error", "An unexpected error occurred", backgroundColor: AppColors.primaryColor);
  }
  }

  String getErrorMessage(String errorCode) {
  switch (errorCode) {
  case 'invalid-email':
  return "The email address is badly formatted.";
  case 'user-disabled':
  return "This user account has been disabled.";
  case 'user-not-found':
  return "No user found with this email.";
  case 'wrong-password':
  return "Incorrect password. Please try again.";
  case 'too-many-requests':
  return "Too many failed login attempts. Try again later.";
  default:
  return "An unknown error occurred. Please try again.";
  }
  }


///Function for logout
void logout()async{
    await auth.signOut();
    Get.offAll(()=> LoginScreen());
}



}