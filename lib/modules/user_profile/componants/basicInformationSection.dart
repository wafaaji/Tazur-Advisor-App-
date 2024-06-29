import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicInformationSection extends StatelessWidget {
  final String experienceYears;
  final String education;
  final String birthday;
  final String gender;
  final String driverLicence;
  final String militaryServices;

  const BasicInformationSection({
    super.key,
    required this.experienceYears,
    required this.education,
    required this.birthday,
    required this.gender,
    required this.driverLicence,
    required this.militaryServices,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return ExpansionTile(
      leading: Icon(
          Icons.info_outline
      ),
      iconColor: primaryGreenColor,
      textColor: primaryGreenColor,
      collapsedTextColor: primaryBlackColor,
      collapsedIconColor: primaryBlackColor,
      title: Align(
        alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
        child: CustomText(
          text: 'basic information'.tr,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        // Experience Years
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText("experience years:".tr, experienceYears),
        ),
        // Education
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText("education:".tr, education),
        ),
        // Birthday
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText("birthday".tr, birthday),
        ),
        // Gender
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText("gender:".tr, gender),
        ),
        // Driver Licence
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText("driver licence:".tr, driverLicence),
        ),
        // Military Services
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText('military services:'.tr, militaryServices),
        ),
      ],
    );
  }

  Widget ListTileText(String key,String info){
    return  Row(
      children: [
        CustomText(
          text: key,
          color: primaryBlackColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.start,
        ),
        CustomText(
          text: info,
          color: primaryBlackColor,
          fontSize: 16.0,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
