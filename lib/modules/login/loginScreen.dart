import 'package:advisor_graduation_project/components/customEasyLoading.dart';
import 'package:advisor_graduation_project/components/customElevatedButton.dart';
import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:advisor_graduation_project/modules/login/components/loginForm.dart';
import 'package:advisor_graduation_project/modules/login/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';

class LoginScreen extends GetView<LoginController> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  primaryGreenColor,
                  secondaryGreenColor
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: CustomText(
                        text:"login".tr,
                        color: primaryBlackColor,
                        fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1300),
                    child: CustomText(
                        text: "login text".tr,
                        color: secondaryBlackColor,
                        fontSize: 18,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 20,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: primaryWhiteColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60,),
                        FadeInUp(duration: Duration(milliseconds: 1400), child: Container(
                          decoration: BoxDecoration(
                            //color: primaryWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: primaryGreenColor,
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              LoginForm(
                                loginFormKey: loginFormKey,
                              ),
                            ],
                          ),
                        )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        FadeInUp(
                          duration: Duration(milliseconds: 1600),
                          child: CustomElevatedButton(
                            onPressed: (){
                              final isValid = loginFormKey.currentState!.validate();
                              if (isValid) {
                                onClickLogin();
                              }
                            },
                            text: 'login button'.tr,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  // For Login Button
  void onClickLogin() async {
    CustomEasyLoading.showLoading();

    await controller.loginOnClick();
    CustomEasyLoading.dismiss();

    if (controller.loginStatus) {
      CustomEasyLoading.showSuccess(controller.message);
      Get.offAllNamed('/home');
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

}