import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TargetJobSection extends StatelessWidget {
  final String topic;
  final String jobEnvironment;
  final String jobTime;
  final String workCity;
  final String currentJob;

  const TargetJobSection({
    super.key,
    required this.topic,
    required this.jobEnvironment,
    required this.jobTime,
    required this.workCity,
    required this.currentJob,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return ExpansionTile(
      leading: Icon(
        Icons.business_center_outlined,
      ),
      iconColor: primaryGreenColor,
      textColor: primaryGreenColor,
      collapsedTextColor: primaryBlackColor,
      collapsedIconColor: primaryBlackColor,
      title: Align(
        alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
        child: CustomText(
          text: 'target job'.tr,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        // Topic
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText("topic:".tr, topic),
        ),
        // Job Environment
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText("job environment:".tr, jobEnvironment),
        ),
        // Job Time
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText("job time:".tr, jobTime),
        ),
        // Work City
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText("work city:".tr, workCity),
        ),
        // Current Job
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: MediaQuery.of(context).size.width * 0.1),
          title: ListTileText("current job:".tr, currentJob),
        ),
      ],
    );
  }

  Widget ListTileText(String key,String info){
    return  Row(
      children: [
        CustomText(
          text: key,
          color: primaryBlackColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.start,
        ),
        Expanded(
          child: CustomText(
            text: info,
            color: primaryBlackColor,
            fontSize: 16.0,
            textAlign: TextAlign.start,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
