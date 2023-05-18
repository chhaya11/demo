import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessVerificationController extends GetxController{
  TextEditingController insTaLinkController = TextEditingController();
  TextEditingController linkDienLinkController = TextEditingController();
  TextEditingController fbLinkController = TextEditingController();
  TextEditingController twitterLinkController = TextEditingController();
  TextEditingController youtubeLinkController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void onClose() {
    insTaLinkController.dispose();
    linkDienLinkController.dispose();
    fbLinkController.dispose();
    twitterLinkController.dispose();
    youtubeLinkController.dispose();
    super.onClose();
  }
}