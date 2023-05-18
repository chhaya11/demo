import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swazei/app/controller/business_verification.dart';

import '../utils/app_colors.dart';

class BusinessVerification extends StatelessWidget {
  BusinessVerification({Key? key}) : super(key: key);
  final businessVerifyController = Get.put(BusinessVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Text('Business Verification', style: TextStyle(
                  color: AppColors.blackText,
                  fontWeight: FontWeight.w700,
                  fontSize: 22.0,
                ),),
              ),
              const SizedBox(height: 16.0,),
              const Text('Add social media links for better reach.', style: TextStyle(
                color: AppColors.blackText,
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),),
              const SizedBox(height: 32.0,),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: businessVerifyController.insTaLinkController,
                validator: (value) =>
                value!.trim().isEmpty
                    ? 'Enter Your Name'
                    : (RegExp(r"^[a-zA-Z]+$").hasMatch(value.trim())
                    ? null
                    : 'Enter a Valid Name'),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text('Burger King')),
              ),
              const SizedBox(height: 30.0,),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: businessVerifyController.linkDienLinkController,
                validator: (value) =>
                value!.trim().isEmpty
                    ? 'Enter Your Name'
                    : (RegExp(r"^[a-zA-Z]+$").hasMatch(value.trim())
                    ? null
                    : 'Enter a Valid Name'),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text('www.burgerking.in')),
              ),
              const SizedBox(height: 30.0,),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: businessVerifyController.fbLinkController,
                validator: (value) =>
                value!.trim().isEmpty
                    ? 'Enter Your Name'
                    : (RegExp(r"^[a-zA-Z]+$").hasMatch(value.trim())
                    ? null
                    : 'Enter a Valid Name'),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text('Address')),
              ),
              const SizedBox(height: 30.0,),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: businessVerifyController.twitterLinkController,
                validator: (value) =>
                value!.trim().isEmpty
                    ? 'Enter Your Name'
                    : (RegExp(r"^[a-zA-Z]+$").hasMatch(value.trim())
                    ? null
                    : 'Enter a Valid Name'),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text('Phone Number (Optional)')),
              ),
              const SizedBox(height: 30.0,),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: businessVerifyController.youtubeLinkController,
                validator: (value) =>
                value!.trim().isEmpty
                    ? 'Enter Your Name'
                    : (RegExp(r"^[a-zA-Z]+$").hasMatch(value.trim())
                    ? null
                    : 'Enter a Valid Name'),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text('Phone Number (Optional)')),
              ),
            ],),
          Positioned(bottom: 20,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  Get.to(()=>BusinessVerification());
                },
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
        ],),
      ),
    );
  }
}
