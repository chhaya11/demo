import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swazei/app/controller/general_info_controller.dart';
import 'package:swazei/app/view/business_info.dart';

import '../utils/app_colors.dart';

class GeneralInformation extends StatelessWidget {
  GeneralInformation({Key? key}) : super(key: key);
   final generalInfoController = Get.put(GeneralInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text('General Information', style: TextStyle(
                    color: AppColors.blackText,
                    fontWeight: FontWeight.w700,
                    fontSize: 22.0,
                  ),),
                ),
                const SizedBox(height: 16.0,),
                const Text('Enter your business details', style: TextStyle(
                  color: AppColors.blackText,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),),
                const SizedBox(height: 32.0,),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: generalInfoController.nameProfileController,
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
                  controller: generalInfoController.urlProfileController,
                  validator: (value) =>
                  value!.trim().isEmpty
                      ? 'Enter Your Url'
                      : (RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+').hasMatch(value.trim())
                      ? null
                      : 'Enter a Valid Name'),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text('www.burgerking.in')),
                ),
                const SizedBox(height: 30.0,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: generalInfoController.addressProfileController,
                  validator: (value) =>
                  value!.trim().isEmpty
                      ? 'Enter Your Address'
                     :   null,

                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text('Address')),
                ),
                const SizedBox(height: 30.0,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: generalInfoController.phoneProfileController,
                  validator: (value) =>
                  value!.trim().isEmpty
                      ? 'Enter Your Phone Number'
                      : (RegExp(r'/^(\+\d{1,3}[- ]?)?\d{10}$/').hasMatch(value.trim())
                      ? null
                      : 'Enter a Valid Number'),
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
                    Get.to(()=>BusinessInformation());
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
      ),
    );
  }
}
