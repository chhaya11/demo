
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swazei/app/controller/general_info_controller.dart';
import 'package:swazei/app/utils/app_colors.dart';
import 'package:swazei/app/view/business_asset.dart';
import 'package:swazei/app/view/business_info.dart';
import 'package:swazei/app/view/business_verification.dart';
import 'package:swazei/app/view/general_information.dart';

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);
  final generalInfoController = Get.put(GeneralInfoController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Image.asset('asset/images/icon.png' , scale: 1.2,),
          title: const Text('Profile', style: TextStyle(
            color: AppColors.blackText,
            fontWeight: FontWeight.w700,
            fontSize: 20
          ),),
            bottom: const TabBar(
              isScrollable: true,
              unselectedLabelColor: AppColors.blackText,
              unselectedLabelStyle: TextStyle(
              color: AppColors.blackText
            ),
              indicatorWeight: 2,// Creates border
                  indicatorColor: AppColors.blueBG,
            tabs: [
            Tab(child: Text("General Information", style: TextStyle(color: AppColors.blueBG),) ,),
              Tab(child: Text("Business Information", style: TextStyle(color: AppColors.blueBG),) ,),
              Tab(child: Text("Business Assets", style: TextStyle(color: AppColors.blueBG),) ,),
              Tab(child: Text("Business Verification", style: TextStyle(color: AppColors.blueBG),) ,),
            ],
            ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: TabBarView(
            children: [
              GeneralInformation(),
              BusinessInformation(),
              BusinessAsset(),
              BusinessVerification()
            ],
          ),
        ),
      ),
    );
  }
}
