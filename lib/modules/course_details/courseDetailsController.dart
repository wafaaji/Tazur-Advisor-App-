import 'package:advisor_graduation_project/model/companyProfile.dart';
import 'package:get/get.dart';

class CourseDetailsController extends GetxController{
  Rx<Course?> courseDetails = Rx<Course?>(null);

  @override
  void onInit() {
    super.onInit();
    processCourseDetails(Get.arguments);
    print('Received course details: $courseDetails');
  }

  // Method in the controller that receives arguments
  void processCourseDetails(Course courseDetails) {
    this.courseDetails.value = courseDetails;
    print('Received course details: $courseDetails');
  }
}