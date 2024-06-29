import 'package:advisor_graduation_project/components/customCircleAvatar.dart';
import 'package:advisor_graduation_project/components/customElevatedButton.dart';
import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRequestsCard extends StatelessWidget {
  final int id;
  final DateTime createdAt;
  final String imgPath;
  final String firstName;
  final String? lastName;
  final String email;
  final VoidCallback onMessagePressed;
  final VoidCallback onDetailsPressed;

  CustomRequestsCard({
    required this.id,
    required this.createdAt,
    required this.imgPath,
    required this.firstName,
    this.lastName,
    required this.email,
    required this.onMessagePressed,
    required this.onDetailsPressed,
  });

  String getFormattedCreationTime() {
    // Calculate the difference between the current time and the creation time of the job
    Duration difference = DateTime.now().difference(createdAt);

    // Format the difference into a human-readable string
    if (difference.inDays > 0) {
      return '${difference.inDays} '+'days ago'.tr;
    } else if (difference.inHours > 0) {
      return '${difference.inHours} '+'hours ago'.tr;
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} '+'minutes ago'.tr;
    } else {
      return 'just now'.tr;
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = getFormattedCreationTime();
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: secondaryWhiteColor,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  text: formattedTime,
                  color: primaryBlackColor.withOpacity(0.50),
                  fontSize: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCircleAvatar(
                      imagePath: imgPath,
                      radius: 40.0,
                      placeholderAssetPath: 'assets/images/no data.png',
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "${firstName}  ${lastName ?? ''}",
                            color: primaryBlackColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          CustomText(
                            text: email,
                            color: primaryBlackColor.withOpacity(0.75),
                            fontSize: 16.0,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomElevatedButton(
                          onPressed: onMessagePressed,
                          text: 'messages button'.tr,
                        ),
                        CustomElevatedButton(
                          onPressed: onDetailsPressed,
                          text: 'details button'.tr,
                        ),
                      ],
                    ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
