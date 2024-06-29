import 'package:advisor_graduation_project/model/userProfile.dart';
import 'package:advisor_graduation_project/modules/user_profile/userProfileService.dart';
import 'package:advisor_graduation_project/native-services/secureStorage.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController{
  SecureStorage storage = SecureStorage();

  // For Show Profile API
  late UserProfileService service;
  RxInt userId = 0.obs;
  var isLoading = true.obs;
  Rx<UserProfile?> userProfile = Rx<UserProfile?>(null);

  @override
  void onInit() {
    super.onInit();
    service = UserProfileService();
    fetchUserProfile();
    processUserProfile(Get.arguments);
    print('Received user id: $userId');
  }

  void fetchUserProfile() async {
    isLoading.value = true;
    try {
      var token = await storage.read("token");
      final profile = await service.displayUserProfile(token!, userId.value);
      userProfile.value = profile;
    } catch (e) {
      print('Error fetching user Profile: $e');
    }
    isLoading.value = false;
  }

  // Method in the controller that receives arguments
  void processUserProfile(int userId) {
    this.userId.value = userId;
    print('Received user id: $userId');
  }
}