import 'package:get/get.dart';
import 'package:swazei/app/view/home.dart';


class SplashController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(seconds: 5) ,
            ()=> Get.offAll(Home()));
  }
}