import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BusinessAssetController extends GetxController{
  TextEditingController descController = TextEditingController();
  RxList<XFile> imageFiles = <XFile>[].obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future pickImage() async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      imageFiles.add(pickedImage);
    } on PlatformException catch (e) {
      print('Somehow Failed to pick image:$e');
    }
  }

  @override
  void onClose() {
    descController.dispose();
    imageFiles.clear();
    super.onClose();
  }
}