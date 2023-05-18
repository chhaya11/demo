import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GeneralInfoController extends GetxController {
  TextEditingController nameProfileController = TextEditingController();
  TextEditingController emailProfileController = TextEditingController();
  TextEditingController addressProfileController = TextEditingController();
  TextEditingController phoneProfileController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    nameProfileController.dispose();
    emailProfileController.dispose();
    addressProfileController.dispose();
    phoneProfileController.dispose();
    super.onClose();
  }
}
