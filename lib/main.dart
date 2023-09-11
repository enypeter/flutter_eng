import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/controllers/controller.dart';
import 'package:flutter_engr/views/screens/authentication/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Payble',
      debugShowCheckedModeBanner: false,
      onInit: () {
        Get.put(Controller());
      },
      theme: ThemeData(
        fontFamily: 'Effra',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.backgroundColor,
        primaryColor: AppColor.primaryColor,
      ),
      home:  const SplashScreen(),
    );
  }
}
