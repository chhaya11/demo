import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swazei/app/controller/splash_controller.dart';

class Splash extends StatelessWidget {
   Splash({Key? key}) : super(key: key);
   final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}
