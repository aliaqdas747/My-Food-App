
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myfood/screens/auth/loginScreen.dart';

import 'package:myfood/services/firebase_options.dart';
import 'package:myfood/services/keys/keys.dart';



void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Stripe.publishableKey = Publishablekey;
  await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Food',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF435A39)),
      ),
      home: LoginScreen(),
    );
  }
}
