import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swazei/app/controller/business_asset_controller.dart';

import '../utils/app_colors.dart';

class BusinessAsset extends StatelessWidget {
   BusinessAsset({Key? key}) : super(key: key);
   final businessAssetController = Get.put(BusinessAssetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Text('Business Information', style: TextStyle(
                  color: AppColors.blackText,
                  fontWeight: FontWeight.w700,
                  fontSize: 22.0,
                ),),
              ),
              const SizedBox(height: 16.0,),
              const Text('Select you business type and mark location.', style: TextStyle(
                color: AppColors.blackText,
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),),
              const SizedBox(height: 32.0,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  businessAssetController.pickImage();
                  },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 14.0 )),
                      child: const Text('Insert Business Logo' , style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700
                      ),)),

              ),
              SizedBox(height: 30,),
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 80,
                child: CircleAvatar(
                  radius: 70 - 5,
                  backgroundImage: Image.file(
                    businessAssetController.image?.value ?? File("".toString()),
                    fit: BoxFit.cover,
                  ).image,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: businessAssetController.descController,
                validator: (value) =>
                value!.trim().isEmpty
                    ? 'Enter Your Name'
                    : (RegExp(r"^[a-zA-Z]+$").hasMatch(value.trim())
                    ? null
                    : 'Enter a Valid Name'),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text('Burger King')),
              ),
            ],),
          Positioned(bottom: 20,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.only(top: 14.0, bottom: 14.0 )),
                    child: const Text('Update and Save Changes' , style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700
                    ),)),
              ))
        ]),),
    );
  }
}
