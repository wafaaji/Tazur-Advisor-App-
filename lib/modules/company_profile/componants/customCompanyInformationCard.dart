import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCompanyInformationCard extends StatelessWidget {
  final String companyName;
  final String companyLocation;

  CustomCompanyInformationCard({
    required this.companyName,
    required this.companyLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          text: companyName,
          color: primaryBlackColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 4.0,
        ),
        CustomText(
          text: companyLocation,
          color: orangeColor,
          fontSize: 16,
        ),
      ],
    );
  }
}
