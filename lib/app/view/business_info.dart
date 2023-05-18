import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swazei/app/controller/business_info_controller.dart';
import 'package:swazei/app/view/business_asset.dart';
import 'package:swazei/app/view/business_verification.dart';

import '../utils/app_colors.dart';

class BusinessInformation extends StatelessWidget {
   BusinessInformation({Key? key}) : super(key: key);
   final businessInfoController = Get.put(BusinessInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Expanded(
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
        DropdownButtonFormField(
            alignment: Alignment.center,
            menuMaxHeight: 250,
            isExpanded: false,
            hint: const Text("Family Owned Business"),
            style: const TextStyle(
                color: AppColors.blackText ,
                fontSize: 17.0,
                fontWeight: FontWeight.w700,
                fontFamily:'DM Sans'
            ),
            icon:const Icon(Icons.arrow_drop_down_sharp ,
              color: AppColors.blackText,),
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 0, right: 0, top: 12, bottom: 12),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: OutlineInputBorder(
                ),
                border: OutlineInputBorder()),
            items: businessInfoController.city.map((element) => DropdownMenuItem(value: element,child: Text(element) ,)).toList(), onChanged: (value){
          businessInfoController.cityVal = value.toString();
        }),
                SizedBox(height: 34,),
                ElevatedButton(onPressed: (){
                  Get.to(()=>BusinessVerification());
                },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 14.0 )),
                    child: const Text('+ Add Location' , style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700
                    ),)),
          ],),
            Positioned(bottom: 20,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Get.to(()=>BusinessAsset());
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
        ]),
      ),),
    );
  }
}
