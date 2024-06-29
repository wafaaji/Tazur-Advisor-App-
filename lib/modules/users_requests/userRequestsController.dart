import 'package:advisor_graduation_project/model/getConsultationRequests.dart';
import 'package:advisor_graduation_project/modules/users_requests/getConsultationRequestsServices.dart';
import 'package:advisor_graduation_project/native-services/secureStorage.dart';
import 'package:get/get.dart';

class UserRequestsController extends GetxController {
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;

  // For Get User Consultation Requests API
  late GetConsultationRequestsServices serviceDisplay;
  var userRequests = <UserConsultation>[].obs;

  @override
  void onInit() {
    super.onInit();
    serviceDisplay = GetConsultationRequestsServices();
    fetchUserRequests(); // Fetch data when the controller is initialized
  }

  // For Get Consultation Requests API
  Future<void> fetchUserRequests() async {
    isLoading.value = true;
    try {
      var token = await storage.read("token");
      if (token != null) {
        var consultationRequests = await serviceDisplay.displayConsultationRequests(token);
        userRequests.value = consultationRequests.userConsultation;
      } else {
        print('Token is null');
      }
    } catch (e) {
      print('Error fetching consultation requests: $e');
    }
    isLoading.value = false;
  }
}
