import 'package:advisor_graduation_project/model/companyProfile.dart';
import 'package:get/get.dart';

class JobDetailsController extends GetxController{
  Rx<Job?> jobDetails = Rx<Job?>(null);

  @override
  void onInit() {
    super.onInit();
    processJobDetails(Get.arguments);
    print('Received job details: $jobDetails');
  }

  // Method in the controller that receives arguments
  void processJobDetails(Job jobDetails) {
    this.jobDetails.value = jobDetails;
    print('Received job details: $jobDetails');
  }
}