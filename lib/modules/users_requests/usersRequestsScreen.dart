import 'package:advisor_graduation_project/components/customNoResult.dart';
import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:advisor_graduation_project/components/customRequestsCard.dart';
import 'package:advisor_graduation_project/modules/users_requests/userRequestsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersRequestsScreen extends GetView<UserRequestsController> {
  // final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreenColor,
        title: CustomText(
          text: "users requests".tr,
          color: primaryWhiteColor,
          fontSize: 25,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(color: primaryGreenColor),
                );
              } else if (controller.userRequests.isEmpty) {
                // Check if the list is empty and show a message if it is
                return CustomNoResult(
                  text: 'no data user'.tr,
                );
              } else {
                // Show the list if there are items
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await controller.fetchUserRequests();
                    },
                    color: primaryWhiteColor,
                    child: ListView.builder(
                      // controller: scrollController,
                      itemCount: controller.userRequests.length,
                      itemBuilder: (context, index) {
                        final userRequests = controller.userRequests[index];
                        return CustomRequestsCard(
                          id: userRequests.id,
                          createdAt: userRequests.createdAt,
                          imgPath: userRequests.user.userCv.image,
                          firstName: userRequests.user.firstName,
                          lastName: userRequests.user.lastName,
                          email: userRequests.user.email,
                          onMessagePressed: () {
                            Get.toNamed("/userMessages", arguments: [userRequests.userId, userRequests.id]);
                          },
                          onDetailsPressed: () {
                            Get.toNamed("/userProfile", arguments: userRequests.userId);
                          },
                        );
                      },
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
