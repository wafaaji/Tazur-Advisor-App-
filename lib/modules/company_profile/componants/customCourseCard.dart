import 'package:advisor_graduation_project/constants.dart';
import 'package:advisor_graduation_project/model/companyProfile.dart';
import 'package:advisor_graduation_project/modules/company_profile/componants/customCardInformation.dart';
import 'package:advisor_graduation_project/modules/company_profile/componants/customCompanyInformationCourseCard.dart';
import 'package:advisor_graduation_project/modules/company_profile/componants/customTitleCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCourseCard extends StatelessWidget {
  final Course courseDetails;
  final String imgPath;
  final String jobTitle;
  final DateTime createdAt;
  final String topic;
  final String startDate;
  final String days;
  final String courseLocation;
  final String price;
  final String companyName;
  final String companyLocation;
  //final bool hiddenName;

  const CustomCourseCard({
    Key? key,
    required this.courseDetails,
    required this.imgPath,
    required this.jobTitle,
    required this.createdAt,
    required this.topic,
    required this.startDate,
    required this.days,
    required this.courseLocation,
    required this.price,
    required this.companyName,
    required this.companyLocation,
    //required this.hiddenName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/courseDetails', arguments: courseDetails);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(
            left: 5.0,
            right: 5.0,
            bottom: 5.0
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
                        imgPath: 'assets/icons/course-card-icons/start date.png',
                        title: 'start date'.tr,
                        text: startDate,
                      ),
                      SizedBox(height: 2.0),
                      CustomCardInformation(
                        imgPath: 'assets/icons/course-card-icons/start date.png',
                        title: 'days'.tr,
                        text: days,
                      ),
                      SizedBox(height: 2.0),
                      CustomCardInformation(
                        imgPath: 'assets/icons/job-card-icons/job location.png',
                        title: 'course location'.tr,
                        text: courseLocation,
                      ),
                      SizedBox(height: 2.0),
                      CustomCardInformation(
                        imgPath: 'assets/icons/course-card-icons/price.png',
                        title: 'price'.tr,
                        text: price,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomCompanyInformationCourseCard(
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