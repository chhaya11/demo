import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swazei/app/controller/business_info_controller.dart';
import 'package:swazei/app/data/data_model.dart';
import 'package:swazei/app/view/business_asset.dart';
import 'package:swazei/app/view/business_verification.dart';

import '../controller/home_controller.dart';
import '../utils/app_colors.dart';

class BusinessInformation extends StatelessWidget {
  BusinessInformation({Key? key}) : super(key: key);
  final businessInfoController = Get.put(BusinessInfoController());
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(children: [
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    'Business Information',
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
                  'Select you business type and mark location.',
                  style: TextStyle(
                    color: AppColors.blackText,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                DropdownButtonFormField(
                    alignment: Alignment.center,
                    value: businessInfoController.businessType,
                    isExpanded: false,
                    hint: const Text("Family Owned Business"),
                    style: const TextStyle(
                        color: AppColors.blackText,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'DM Sans'),
                    icon: const Icon(
                      Icons.arrow_drop_down_sharp,
                      color: AppColors.blackText,
                    ),
                    decoration: const InputDecoration(
                        isDense: false,
                        contentPadding: EdgeInsets.only(
                            left: 15, right: 15, top: 12, bottom: 12),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder()),
                    items: businessInfoController.city
                        .map((element) => DropdownMenuItem(
                              value: element,
                              child: Text(element),
                            ))
                        .toList(),
                    onChanged: (value) {
                      businessInfoController.businessType = value.toString();
                    }),
                const SizedBox(
                  height: 34,
                ),
                Container(
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gradient: LinearGradient(colors: [AppColors.addLocationGradientStartColor, AppColors.addLocationGradientEndColor],
                    begin: Alignment.bottomLeft, end: Alignment.topRight)
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 0.0),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                      child: const Text(
                        '+ Add Location',
                        style:
                            TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                      )),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)),
                gradient: LinearGradient(colors: [
                  AppColors.buttonGradientStartColor,
                  AppColors.buttonGradientEndColor,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: ElevatedButton(
                onPressed: () {
                  homeController.updateBusinessInformation(BusinessInformationModel(
                    businessType: businessInfoController.businessType
                  ));
                  homeController.tabController?.animateTo(2);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding:
                        const EdgeInsets.only(top: 14.0, bottom: 14.0),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,),
                child: const Text(
                  'Update and Save Changes',
                  style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w700),
                )),
          )
        ]),
      ),
    );
  }
}
