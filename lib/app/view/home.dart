import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swazei/app/controller/general_info_controller.dart';
import 'package:swazei/app/controller/home_controller.dart';
import 'package:swazei/app/utils/app_colors.dart';
import 'package:swazei/app/view/business_asset.dart';
import 'package:swazei/app/view/business_info.dart';
import 'package:swazei/app/view/business_verification.dart';
import 'package:swazei/app/view/general_information.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    homeController.tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(onTap: () {
              if ((homeController.tabController?.index ?? 0) > 0) {
                homeController.tabController?.animateTo((homeController.tabController?.index ?? 1) - 1);
              }
            },child: Image.asset('asset/images/icon_back.png')),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
              color: AppColors.blackText,
              fontWeight: FontWeight.w700,
              fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          IgnorePointer(
            child: TabBar(
              isScrollable: true,
              controller: homeController.tabController,
              labelColor: AppColors.blueBG,
              automaticIndicatorColorAdjustment: true,
              unselectedLabelColor: AppColors.unselectedTabColor,
              indicatorColor: AppColors.blueBG,
              indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: AppColors.blueBG, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              tabs: const [
                Tab(
                  child: Text(
                    "General Information",
                  ),

                ),
                Tab(
                  child: Text(
                    "Business Information",
                  ),
                ),
                Tab(
                  child: Text(
                    "Business Assets",
                  ),
                ),
                Tab(
                  child: Text(
                    "Business Verification",
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.8,
            color: AppColors.dividerColor,
            height: 0.8,
          ),
          Expanded(
            child: TabBarView(
              controller: homeController.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                GeneralInformation(),
                BusinessInformation(),
                BusinessAsset(),
                BusinessVerification()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
