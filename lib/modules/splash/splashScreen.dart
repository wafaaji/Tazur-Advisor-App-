import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:advisor_graduation_project/modules/splash/splashController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  CustomText(
                    text: "Advisor Application",
                    fontSize: 30.0,
                    color: primaryGreenColor,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              child:CircularProgressIndicator(
                color: primaryGreenColor,
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
