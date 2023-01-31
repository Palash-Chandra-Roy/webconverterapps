import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:web_converter/Screen/Home/HomeScreen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(HomeScreen());
    });

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
