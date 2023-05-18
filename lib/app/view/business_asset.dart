import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:swazei/app/controller/business_asset_controller.dart';
import 'package:swazei/app/data/data_model.dart';

import '../controller/home_controller.dart';
import '../utils/app_colors.dart';

class BusinessAsset extends StatelessWidget {
  BusinessAsset({Key? key}) : super(key: key);
  final businessAssetController = Get.put(BusinessAssetController());
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(children: [
          Expanded(
            child: Form(
              key: businessAssetController.formKey,
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
                    'Add Business logo and description.',
                    style: TextStyle(
                      color: AppColors.blackText,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          businessAssetController.pickImage();
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28.0, vertical: 14.0),
                            backgroundColor: AppColors.insertBusinessLogoColor),
                        child: const Text(
                          'Insert Business Logo',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.insertBusinessLogoTextColor),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => businessAssetController.imageFiles.isNotEmpty
                        ? SizedBox(
                            height: 90,
                            child: Obx(
                              () => ListView.builder(
                                itemBuilder: (ctx, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SizedBox(
                                      width: 70,
                                      height: 70,
                                      child: Stack(
                                        fit: StackFit.loose,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Image.file(
                                            File(businessAssetController
                                                .imageFiles[index].path),
                                            height: 65,
                                            width: 65,
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            right: -5,
                                            top: -5,
                                            child: GestureDetector(
                                                onTap: () {
                                                  businessAssetController
                                                      .imageFiles
                                                      .removeAt(index);
                                                },
                                                child: const Icon(
                                                    MdiIcons.closeCircle,
                                                    size: 20)),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount:
                                    businessAssetController.imageFiles.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: businessAssetController.descController,
                    textInputAction: TextInputAction.newline,
                    minLines: 2,
                    maxLines: 5,
                    validator: (value) => value!.trim().isEmpty
                        ? 'Enter Description'
                        :  null,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          'Description',
                          textAlign: TextAlign.start,
                        ),
                        contentPadding: EdgeInsets.all(12)),
                  ),
                  const SizedBox(
                    height: 150,
                  )
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
                  if (businessAssetController.formKey.currentState?.validate() == true) {
                    homeController.updateBusinessAssets(BusinessAssetsModel(
                      description: businessAssetController.descController.text,
                      logo: businessAssetController.imageFiles.isNotEmpty ? businessAssetController.imageFiles.first.path : ""
                    ));
                    homeController.tabController?.animateTo(3);
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
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                )),
          )
        ]),
      ),
    );
  }
}
