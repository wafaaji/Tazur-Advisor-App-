import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreenColor,
        title: Center(
          child: CustomText(
            text: 'notifications'.tr,
            color: primaryWhiteColor,
          ),
        ),
      ),
      body: Center(
        child: Text(
            "Notificationss"
        ),
      ),
    );
  }
}
