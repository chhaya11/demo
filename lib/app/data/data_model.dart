import 'dart:convert';

class DataModel {
  GeneralInformationModel? generalInformationModel;
  BusinessInformationModel? businessInformationModel;
  BusinessAssetsModel? businessAssetsModel;
  BusinessVerificationModel? businessVerificationModel;

  String toJson() {
    return json.encode({
      "general_info": generalInformationModel?.toJson() ?? "",
      "business_info": businessInformationModel?.toJson() ?? "",
      "business_assets": businessAssetsModel?.toJson() ?? "",
      "business_verification": businessVerificationModel?.toJson() ?? "",
    });
  }
}

class GeneralInformationModel {
  String? name;
  String? email;
  String? address;
  String? phoneNumber;

  GeneralInformationModel(
      {this.name, this.email, this.address, this.phoneNumber});

  Map<String, String> toJson() {
    return {
      "name": name ?? "",
      "email": email ?? "",
      "address": address ?? "",
      "phoneNumber": phoneNumber ?? "",
    };
  }
}

class BusinessInformationModel {
  String? businessType;
  String location = "Ludhiana";

  BusinessInformationModel({this.businessType});

  Map<String, String> toJson() {
    return {
      "businessType": businessType ?? "",
      "location": location,
    };
  }
}

class BusinessAssetsModel {
  String? description;
  String? logo;

  BusinessAssetsModel({this.description, this.logo});

  Map<String, String> toJson() {
    return {
      "description": description ?? "",
      "logo": logo ?? "",
    };
  }
}

class BusinessVerificationModel {
  String? instaLink;
  String? linkedInLink;
  String? fbLink;
  String? twitterLink;
  String? youtubeLink;

  BusinessVerificationModel(
      {this.instaLink,
      this.fbLink,
      this.linkedInLink,
      this.twitterLink,
      this.youtubeLink});

  Map<String, String> toJson() {
    return {
      "instaLink": instaLink ?? "",
      "linkedInLink": linkedInLink ?? "",
      "fbLink": fbLink ?? "",
      "twitterLink": twitterLink ?? "",
      "youtubeLink": youtubeLink ?? "",
    };
  }
}
