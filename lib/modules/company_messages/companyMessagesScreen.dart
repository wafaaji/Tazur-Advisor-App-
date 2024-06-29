import 'package:advisor_graduation_project/components/customAppBar.dart';
import 'package:advisor_graduation_project/components/customElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:advisor_graduation_project/modules/company_messages/companyMessagesController.dart';
import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';

class CompanyMessagesScreen extends StatelessWidget {
  final CompanyMessagesController controller = Get.put(CompanyMessagesController());

  CompanyMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      appBar: CustomAppBar(
        title: 'company messages'.tr,
        onPressed: () {
          Get.back();
        },
        isArabic: isArabic,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: primaryGreenColor,
            ),
          );
        }
        if (controller.companyMessages.isEmpty) {
          return Center(
            child: CustomText(
              text: 'No messages found',
              color: primaryBlackColor,
              fontSize: 18,
            ),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.companyMessages.length,
                itemBuilder: (context, index) {
                  final companyMessages = controller.companyMessages[index];
                  DateTime createdAt = companyMessages.createdAt;

                  String formattedDate =
                      '${createdAt.day} ${_getMonthName(createdAt.month)} ${createdAt.year}';
                  String formattedTime =
                      '${createdAt.hour}:${createdAt.minute.toString().padLeft(2, '0')}';

                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: orangeColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(4.0),
                          child: CustomText(
                            text: formattedDate,
                            color: primaryBlackColor.withOpacity(0.75),
                            fontSize: 14,
                          ),
                        ),
                        // User Message
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                               width: MediaQuery.of(context).size.width * 0.8,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: primaryGreenColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                              ),
                              child: CustomText(
                                text: companyMessages.userMessage ?? "",
                                color: primaryBlackColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                        // Advisor Message
                        companyMessages.advisorReply == null ?
                        SizedBox() :
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: secondaryWhiteColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                              ),
                              child: CustomText(
                                text: companyMessages.advisorReply ?? "",
                                color: primaryBlackColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            CustomElevatedButton(
              onPressed: () {
                Get.toNamed("/replyToCompany", arguments: controller.requestId.value);
              },
              text: "reply to company button".tr,
            ),
            SizedBox(height: 20),
          ],
        );
      }),
    );
  }

  // Helper function to get month name
  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'jan'.tr;
      case 2:
        return 'feb'.tr;
      case 3:
        return 'mar'.tr;
      case 4:
        return 'apr'.tr;
      case 5:
        return 'may'.tr;
      case 6:
        return 'jun'.tr;
      case 7:
        return 'jul'.tr;
      case 8:
        return 'aug'.tr;
      case 9:
        return 'sep'.tr;
      case 10:
        return 'oct'.tr;
      case 11:
        return 'nov'.tr;
      case 12:
        return 'dec'.tr;
      default:
        return '';
    }
  }
}
