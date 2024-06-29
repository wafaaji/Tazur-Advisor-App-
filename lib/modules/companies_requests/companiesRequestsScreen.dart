import 'package:advisor_graduation_project/components/customNoResult.dart';
import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:advisor_graduation_project/components/customRequestsCard.dart';
import 'package:advisor_graduation_project/modules/companies_requests/companiesRequestsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CompaniesRequestsScreen extends GetView<CompaniesRequestsController> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreenColor,
        title: CustomText(
          text: "companies requests".tr,
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
              } else if (controller.companiesRequests.isEmpty) {
                // Check if the list is empty and show a message if it is
                return CustomNoResult(
                  text: 'no data company'.tr,
                );
              } else {
                // Show the list if there are items
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await controller.fetchCompaniesRequests();
                    },
                    color: primaryWhiteColor,
                    child: ListView.builder(
                     // controller: scrollController,
                      itemCount: controller.companiesRequests.length,
                      itemBuilder: (context, index) {
                        final companyRequests = controller.companiesRequests[index];
                        return CustomRequestsCard(
                          id: companyRequests.id,
                          createdAt: companyRequests.createdAt,
                          imgPath: companyRequests.company.logo,
                          firstName: companyRequests.company.name,
                          email: companyRequests.company.email,
                          onMessagePressed: (){
                            Get.toNamed("/companyMessages", arguments: [companyRequests.companyId, companyRequests.id]);
                          },
                          onDetailsPressed: (){
                            final companyId = companyRequests.companyId;
                            if (companyId != null) {
                              Get.toNamed("/companyProfile", arguments: companyId);
                            } else {
                              // Handle the null case or show an error
                              print("Company ID is null");
                            }
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
