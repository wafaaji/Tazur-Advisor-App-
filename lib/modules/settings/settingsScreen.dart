import 'package:advisor_graduation_project/components/customEasyLoading.dart';
import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:advisor_graduation_project/language/localController.dart';
import 'package:advisor_graduation_project/modules/settings/component/settingsContainer.dart';
import 'package:advisor_graduation_project/modules/settings/settingsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends GetView<SettingsController> {
  LocaleController controllerLang = Get.find();

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreenColor,
        title: CustomText(
            text: 'settings'.tr,
            color: primaryWhiteColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SettingsContainer(
              imagePath: 'assets/icons/settings_icons/language.png',
              text: 'change language'.tr,
              onPressed: (){
                controllerLang.changeLang();
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            SettingsContainer(
              imagePath: 'assets/icons/settings_icons/logout.png',
              text: 'logout'.tr,
              onPressed: (){
                onClickLogout();
              },
            ),
          ],
        ),
      ),
    );
  }

  // Logout
  void onClickLogout() async{
    CustomEasyLoading.showLoading();

    await controller.logoutOnClick();
    CustomEasyLoading.dismiss();

    if(controller.logoutStatus){
      CustomEasyLoading.showSuccess(controller.message);
      Get.offAllNamed("/splash");
    }else{
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

  // Change language
  void changeLanguage() {
    controllerLang.changeLang();

    // Reload the app after changing the language
    Get.offNamed("/splash")!.then((_) {
      Get.reset(); // Reset all controllers and services
      Get.find(); // Reinitialize all controllers and services
    });
  }

}
