import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:advisor_graduation_project/modules/company_profile/companyProfileController.dart';
import 'package:advisor_graduation_project/modules/company_profile/componants/customAboutCompany.dart';
import 'package:advisor_graduation_project/modules/company_profile/componants/customCourseCard.dart';
import 'package:advisor_graduation_project/modules/company_profile/componants/customJobCard.dart';
import 'package:advisor_graduation_project/modules/company_profile/componants/tabButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyProfileScreen extends StatelessWidget  {
  final CompanyProfileController controller = Get.put(CompanyProfileController());


  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: primaryGreenColor,
            ),
          );
        } else if (controller.companyProfile.value == null) {
          return Center(
            child: Text('Error loading company profile.'),
          );
        } else {
          final companyProfile = controller.companyProfile.value;
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        companyProfile!.company.logo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: kToolbarHeight,
                      left: isArabic ? null : 10,
                      right: isArabic ? 10 : null,
                      child: IconButton(
                        icon: Icon(
                            Icons.arrow_back,
                          color: primaryBlackColor,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        color: primaryWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: companyProfile.company.name,
                                color: primaryBlackColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                              ),
                              CustomText(
                                text:companyProfile.company.location,
                                color: primaryBlackColor.withOpacity(0.50),
                                fontSize: 16.0,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          CustomText(
                            text: companyProfile.company.email,
                            color: primaryBlackColor.withOpacity(0.75),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                          CustomText(
                            text: companyProfile.company.phone,
                            color: primaryBlackColor.withOpacity(0.75),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                          CustomText(
                            text: companyProfile.company.fax,
                            color: primaryBlackColor.withOpacity(0.50),
                            fontSize: 16.0,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: primaryWhiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => TabButton(
                      text: 'jobs'.tr,
                      onPressed: () => controller.selectTab(0),
                      isSelected: controller.selectedIndex.value == 0,
                    )),
                    Obx(() => TabButton(
                      text: 'courses'.tr,
                      onPressed: () => controller.selectTab(1),
                      isSelected: controller.selectedIndex.value == 1,
                    )),
                    Obx(() => TabButton(
                      text: 'about company'.tr,
                      onPressed: () => controller.selectTab(2),
                      isSelected: controller.selectedIndex.value == 2,
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  switch (controller.selectedIndex.value) {
                    case 0:
                      return companyProfile.jobs.isNotEmpty
                          ? ListView.builder(
                        itemCount: companyProfile.jobs.length,
                        itemBuilder: (context, index) {
                          final job = companyProfile.jobs[index];
                          return CustomJobCard(
                            companyProfile: job,
                            imgPath: companyProfile.company.logo,
                            jobTitle: job.jobTitle,
                            createdAt: job.createdAt,
                            topic: job.topic,
                            experienceYears: job.experienseYears,
                            jobTime: job.jobTime,
                            location: job.location,
                            companyName: companyProfile.company.name,
                            companyLocation: companyProfile.company.location,
                          );
                        },
                      )
                          : Center(
                        child: Text('no jobs available.'.tr),
                      );
                    case 1:
                      return companyProfile.courses.isNotEmpty
                          ? ListView.builder(
                        itemCount: companyProfile.courses.length,
                        itemBuilder: (context, index) {
                          final course = companyProfile.courses[index];
                          return CustomCourseCard(
                            courseDetails: course,
                            imgPath: companyProfile.company.logo,
                            jobTitle: course.name,
                            createdAt: course.createdAt,
                            topic: course.topic,
                            companyName: companyProfile.company.name,
                            companyLocation: companyProfile.company.location,
                            startDate: course.startDate.toString(),
                            days: course.days.toString(),
                            courseLocation: course.location,
                            price: course.price.toString(),
                          );
                        },
                      )
                          : Center(
                        child: Text('no courses available.'.tr),
                      );
                    case 2:
                      return CustomAboutCompany(
                        type: companyProfile.company.type.join(', '),
                        topic: companyProfile.company.topic,
                        aboutUs: companyProfile.company.aboutUs,
                      );
                    default:
                      return SizedBox();
                  }
                }),
              ),
            ],
          );
        }
      }),
    );
  }
}
