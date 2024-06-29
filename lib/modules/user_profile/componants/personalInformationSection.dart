import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInformationSection extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String governorate;
  final String address;
  final String familyState;
  final String nationality;

  const PersonalInformationSection({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.governorate,
    required this.address,
    required this.familyState,
    required this.nationality,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return ExpansionTile(
      leading: Icon(
        Icons.person_outline_outlined,
      ),
      iconColor: primaryGreenColor,
      textColor: primaryGreenColor,
      collapsedTextColor: primaryBlackColor,
      collapsedIconColor: primaryBlackColor,
      title: Align(
        alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
        child: CustomText(
          text: 'personal information'.tr,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        // Name
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText('name'.tr, name),
        ),
        // Email
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText('email:'.tr, email),
        ),
        // Phone
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText('phone'.tr, phone),
        ),
        // Governorate
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText('governorate'.tr, governorate),
        ),
        // Address
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText('address'.tr, address),
        ),
        // Family State
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText('family state'.tr, familyState),
        ),
        // Nationality
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText('nationality'.tr, nationality),
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
