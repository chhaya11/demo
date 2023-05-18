import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swazei/app/controller/business_verification.dart';
import 'package:swazei/app/data/data_model.dart';

import '../controller/home_controller.dart';
import '../utils/app_colors.dart';

class BusinessVerification extends StatelessWidget {
  BusinessVerification({Key? key}) : super(key: key);
  final businessVerifyController = Get.put(BusinessVerificationController());
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: businessVerifyController.formKey,
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        'Business Verification',
                        style: TextStyle(
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w700,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Text(
                      'Add social media links for better reach.',
                      style: TextStyle(
                        color: AppColors.blackText,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: businessVerifyController.insTaLinkController,
                      validator: (value) => value!.trim().isEmpty
                          ? null
                          : (RegExp(r"https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)")
                                  .hasMatch(value.trim())
                              ? null
                              : 'Enter a Valid link'),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Instagram Link (Optional)')),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller:
                          businessVerifyController.linkDienLinkController,
                      validator: (value) => value!.trim().isEmpty
                          ? null
                          : (RegExp(r"https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)")
                                  .hasMatch(value.trim())
                              ? null
                              : 'Enter a Valid link'),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('LinkedIn Link (Optional)')),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: businessVerifyController.fbLinkController,
                      validator: (value) => value!.trim().isEmpty
                          ? null
                          : (RegExp(r"https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)")
                                  .hasMatch(value.trim())
                              ? null
                              : 'Enter a Valid link'),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Facebook Link (Optional)')),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller:
                          businessVerifyController.twitterLinkController,
                      validator: (value) => value!.trim().isEmpty
                          ? null
                          : (RegExp(r"https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)")
                                  .hasMatch(value.trim())
                              ? null
                              : 'Enter a link'),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Twitter Link (Optional)')),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller:
                          businessVerifyController.youtubeLinkController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('YouTube Link (Optional)')),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  gradient: LinearGradient(colors: [
                    AppColors.buttonGradientStartColor,
                    AppColors.buttonGradientEndColor,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: ElevatedButton(
                  onPressed: () {
                    if (businessVerifyController.formKey.currentState
                            ?.validate() ==
                        true) {

                      homeController.updateBusinessVerification(BusinessVerificationModel(
                        instaLink: businessVerifyController.insTaLinkController.text,
                        linkedInLink: businessVerifyController.linkDienLinkController.text,
                        fbLink: businessVerifyController.fbLinkController.text,
                        twitterLink: businessVerifyController.twitterLinkController.text,
                        youtubeLink: businessVerifyController.youtubeLinkController.text,
                      ));

                      //print to console here
                      homeController.printDataToConsole();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    'Update and Save Changes',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
