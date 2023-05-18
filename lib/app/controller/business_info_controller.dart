import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessInfoController extends GetxController{
  TextEditingController nameProfileController = TextEditingController();
  TextEditingController urlProfileController = TextEditingController();

  var businessType = 'Family Owned Business';
  List city =[
    'Family Owned Business1',
    'Family Owned Business2',
    'Family Owned Business'
  ];

  @override
  void onClose() {
    nameProfileController.dispose();
    urlProfileController.dispose();
    super.onClose();
  }
}