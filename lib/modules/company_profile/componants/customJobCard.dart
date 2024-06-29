import 'package:advisor_graduation_project/constants.dart';
import 'package:advisor_graduation_project/model/companyProfile.dart';
import 'package:advisor_graduation_project/modules/company_profile/componants/customCardInformation.dart';
import 'package:advisor_graduation_project/modules/company_profile/componants/customCompanyInformationCard.dart';
import 'package:advisor_graduation_project/modules/company_profile/componants/customTitleCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomJobCard extends StatelessWidget {
  final Job companyProfile;
  final String imgPath;
  final String jobTitle;
  final DateTime createdAt;
  final String topic;
  final String experienceYears;
  final String jobTime;
  final String location;
  final String companyName;
  final String companyLocation;

  const CustomJobCard({
    required this.companyProfile,
    required this.imgPath,
    required this.jobTitle,
    required this.createdAt,
    required this.topic,
    required this.experienceYears,
    required this.jobTime,
    required this.location,
    required this.companyName,
    required this.companyLocation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/jobDetails', arguments: companyProfile);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(
            left: 5.0,
            right: 5.0,
            bottom: 5.0,
          ),
          child: Card(
            elevation: 5.0,
            color: primaryWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomTitleCard(
                    imgPath: imgPath,
                    title: jobTitle,
                    createdAt: createdAt,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      CustomCardInformation(
                        imgPath: 'assets/icons/job-card-icons/topic.png',
                        title: 'topic'.tr,
                        text: topic,
                      ),
                      SizedBox(height: 2.0),
                      CustomCardInformation(
                        imgPath: 'assets/icons/job-card-icons/experience.png',
                        title: 'experience'.tr,
                        text: experienceYears,
                      ),
                      SizedBox(height: 2.0),
                      CustomCardInformation(
                        imgPath: 'assets/icons/job-card-icons/job time.png',
                        title: 'job time'.tr,
                        text: jobTime,
                      ),
                      SizedBox(height: 2.0),
                      CustomCardInformation(
                        imgPath: 'assets/icons/job-card-icons/job location.png',
                        title: 'job location'.tr,
                        text: location,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomCompanyInformationCard(
                    companyName: companyName,
                    companyLocation: companyLocation,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}