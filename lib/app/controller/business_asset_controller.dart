import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BusinessAssetController extends GetxController{
  TextEditingController descController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pickImage();
  }
  Rx<File?>? image;
  XFile? imageTemp;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTamporary = File(image.path.toString());
      this.image?.value = imageTamporary;
      // setState(() {

      // });
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }



}