import 'package:advisor_graduation_project/components/customAppBar.dart';
import 'package:advisor_graduation_project/components/customEasyLoading.dart';
import 'package:advisor_graduation_project/components/customElevatedButton.dart';
import 'package:advisor_graduation_project/components/customTextField.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:advisor_graduation_project/modules/reply_to_user/replyToUserController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReplyToUserScreen extends GetView<ReplyToUserController> {
  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      appBar: CustomAppBar(
        title: 'reply to user'.tr,
        onPressed: () {
          Get.back();
        },
        isArabic: isArabic,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.formKey, // Assign form key
              child: Column(
                children: [
                  // The Message
                  CustomTextField(
                    controller: controller.replyController,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    decoration: InputDecoration(
                      hintText: 'reply to user'.tr,
                    ),
                    validator: (value) {
                      return controller.validateReply(value!);
                    },
                    hintSize: 14.0,
                    hintColor: primaryBlackColor.withOpacity(0.50),
                  ),
                  // Send Button
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomElevatedButton(
                            onPressed: () {
                              onClickSend();
                            },
                            text: 'send button'.tr,
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // For Send Button
  void onClickSend() async {
    if (controller.formKey.currentState!.validate()) {
      CustomEasyLoading.showLoading();

      // Await the completion of applyOnClick method
      await controller.replyOnClick();

      // Dismiss loading indicator
      CustomEasyLoading.dismiss();

      if (controller.replyStatus) {
        CustomEasyLoading.showSuccess(controller.message);
        Get.offAllNamed('/home');
      } else {
        CustomEasyLoading.showError(controller.message);
        print("Error Here");
      }
    }
  }
}