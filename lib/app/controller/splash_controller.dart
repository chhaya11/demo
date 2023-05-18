import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:swazei/app/view/home.dart';


class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2) ,
            ()=> Get.offAll(() => const Home()));
  }
}