import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swazei/app/data/data_model.dart';

class HomeController extends GetxController {

  TabController? tabController;
  DataModel dataModel = DataModel();

  void printDataToConsole() {
    print(dataModel.toJson());
  }

  void updateGeneralInformation(GeneralInformationModel generalInformationModel) {
    dataModel.generalInformationModel = generalInformationModel;
  }

  void updateBusinessInformation(BusinessInformationModel businessInformationModel) {
    dataModel.businessInformationModel = businessInformationModel;
  }

  void updateBusinessAssets(BusinessAssetsModel businessAssetsModel) {
    dataModel.businessAssetsModel = businessAssetsModel;
  }

  void updateBusinessVerification(BusinessVerificationModel businessVerificationModel) {
    dataModel.businessVerificationModel = businessVerificationModel;
  }

  void resetData() {
    dataModel = DataModel();
  }
}