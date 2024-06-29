import 'package:advisor_graduation_project/components/customAppBar.dart';
import 'package:advisor_graduation_project/components/customText.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:advisor_graduation_project/modules/user_profile/componants/basicInformationSection.dart';
import 'package:advisor_graduation_project/modules/user_profile/componants/personalInformationSection.dart';
import 'package:advisor_graduation_project/modules/user_profile/componants/targetJobSection.dart';
import 'package:advisor_graduation_project/modules/user_profile/userProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatelessWidget {
  final UserProfileController controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      appBar: CustomAppBar(
        title: 'user profile'.tr,
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
        } else if (controller.userProfile.value == null) {
          return Center(
            child: Text('Error loading user profile.'),
          );
        } else {
          final userProfile = controller.userProfile.value!;
          final userCv = userProfile.userCv;
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  CircleAvatar(
                    backgroundImage: userCv.image != null && userCv.image.isNotEmpty
                        ? NetworkImage(userCv.image)
                        : AssetImage('assets/images/no data.png') as ImageProvider,
                    radius: 65,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: '${userProfile.firstName}  ${userProfile.lastName}',
                    color: primaryBlackColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: userProfile.email,
                    color: primaryBlackColor.withOpacity(0.75),
                    fontSize: 20.0,
                  ),
                  const SizedBox(height: 20),
                  PersonalInformationSection(
                    name: '${userProfile.firstName} ${userProfile.lastName}',
                    email: '${userProfile.email}',
                    phone: '${userProfile.phone}',
                    governorate: '${userProfile.governorate}',
                    address: '${userProfile.address}',
                    familyState: '${userProfile.maritalStatus}',
                    nationality: '${userProfile.nationality}',
                  ),
                  BasicInformationSection(
                    experienceYears: '${userProfile.experienceYears}',
                    education: '${userProfile.education}',
                    birthday: '${userProfile.birthday.toLocal().toIso8601String().split('T').first}',
                    gender: '${userProfile.gender}',
                    driverLicence: userProfile.drivingLicense == '0' ? 'No' : 'Yes',
                    militaryServices: '${userProfile.militaryStatus}',
                  ),
                  TargetJobSection(
                    topic: '${userProfile.topic.join(', ')}',
                    jobEnvironment: userCv?.jobEnvironment?.join(', ') ?? 'N/A',
                    jobTime: userCv?.jobTime?.join(', ') ?? 'N/A',
                    workCity: userCv?.workCity?.join(', ') ?? 'N/A',
                    currentJob: userCv?.jobCurrent ?? 'N/A',
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
