import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swazei/app/controller/general_info_controller.dart';
import 'package:swazei/app/controller/home_controller.dart';
import 'package:swazei/app/data/data_model.dart';

import '../utils/app_colors.dart';

class GeneralInformation extends StatelessWidget {
  GeneralInformation({Key? key}) : super(key: key);
  final generalInfoController = Get.put(GeneralInfoController());
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: generalInfoController.formKey,
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        'General Information',
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
                      'Enter your business details',
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
                      controller: generalInfoController.nameProfileController,
                      validator: (value) => value!.trim().isEmpty
                          ? 'Enter Your Name'
                          : (RegExp(r"^[a-zA-Z]+$").hasMatch(value.trim())
                              ? null
                              : 'Enter a Valid Name'),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text('Name')),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: generalInfoController.emailProfileController,
                      validator: (value) => value!.trim().isEmpty
                          ? 'Enter Your email'
                          : (RegExp(r'(?:(?:https?|ftp):\\/\\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+')
                                  .hasMatch(value.trim())
                              ? null
                              : 'Enter a Valid Name'),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text('Email')),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller:
                          generalInfoController.addressProfileController,
                      validator: (value) =>
                          value!.trim().isEmpty ? 'Enter Your Address' : null,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text('Address')),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: generalInfoController.phoneProfileController,
                      maxLength: 10,
                      validator: (String? value) {
                        if (value?.trim().isEmpty == true) {
                          return null;
                        } else {
                          return (value?.trim().length ?? 0) >= 10
                              ? null
                              : 'Enter a Valid Number';
                        }
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Phone Number (Optional)')),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    gradient: LinearGradient(
                        colors: [
                          AppColors.buttonGradientStartColor,
                          AppColors.buttonGradientEndColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: ElevatedButton(
                    onPressed: () {
                      if (generalInfoController.formKey.currentState
                              ?.validate() ==
                          true) {
                        homeController
                            .updateGeneralInformation(GeneralInformationModel(
                          name:
                              generalInfoController.nameProfileController.text,
                          email:
                              generalInfoController.emailProfileController.text,
                          address: generalInfoController
                              .addressProfileController.text,
                          phoneNumber:
                              generalInfoController.phoneProfileController.text,
                        ));
                        homeController.tabController?.animateTo(1);
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
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w700),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
