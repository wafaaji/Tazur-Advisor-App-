import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAboutCompany extends StatelessWidget {
  final String type;
  final String topic;
  final String aboutUs;

  const CustomAboutCompany({
    super.key,
    required this.type,
    required this.topic,
    required this.aboutUs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: primaryBlackColor,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text: "type".tr,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  color: primaryGreenColor,
                ),
                SizedBox(
                  width: 10.0,
                ),
                CustomText(
                  text: type,
                  color: primaryBlackColor,
                  fontSize: 16.0,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                CustomText(
                  text: "topic: ".tr,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  color: primaryGreenColor,
                ),
                SizedBox(
                  width: 10.0,
                ),
                CustomText(
                  text: topic,
                  color: primaryBlackColor,
                  fontSize: 16.0,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            CustomText(
              text: 'about us'.tr,
              color: primaryGreenColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
            CustomText(
              text: aboutUs,
              color: primaryBlackColor,
              fontSize: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
