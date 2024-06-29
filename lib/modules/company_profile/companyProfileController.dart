import 'package:advisor_graduation_project/model/companyProfile.dart';
import 'package:advisor_graduation_project/modules/company_profile/companyProfileService.dart';
import 'package:advisor_graduation_project/native-services/secureStorage.dart';
import 'package:get/get.dart';

class CompanyProfileController extends GetxController {
  var selectedIndex = 0.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  // For Company Profile API
  SecureStorage storage = SecureStorage();
  RxInt companyId = 0.obs;
  var isLoading = true.obs;
  late CompanyProfileService profileService;
  Rx<CompanyProfile?> companyProfile = Rx<CompanyProfile?>(null);
  RxString error = RxString('');


  @override
  void onInit() {
    super.onInit();
    profileService = CompanyProfileService();
    fetchCompanyProfile();
    processCompanyProfile(Get.arguments);
    print('Received company id: $companyId');
  }

  void fetchCompanyProfile() async {
    isLoading.value = true;
    try {
      var token = await storage.read("token");
      final profile = await profileService.displayCompanyProfile(token!, companyId.value);
      companyProfile.value = profile;
        } catch (e) {
      print('Error fetching company Profile: $e');
      error.value = 'Error fetching company Profile: $e';
    }
    isLoading.value = false;
  }

  // Method in the controller that receives arguments
  void processCompanyProfile(int companyId) {
    this.companyId.value = companyId;
    print('Received company id: $companyId');
  }

}