import 'package:advisor_graduation_project/model/getConsultationRequests.dart';
import 'package:advisor_graduation_project/modules/users_requests/getConsultationRequestsServices.dart';
import 'package:advisor_graduation_project/native-services/secureStorage.dart';
import 'package:get/get.dart';

class CompaniesRequestsController extends GetxController {
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;

  // For Get User Consultation Requests API
  late GetConsultationRequestsServices serviceDisplay;
  var companiesRequests = <CompanyConsultation>[].obs;

  @override
  void onInit() async{
    serviceDisplay = GetConsultationRequestsServices();
    fetchCompaniesRequests(); // Fetch data when the controller is initialized
    super.onInit();
  }


  // For Get Consultation Requests API
  Future<void> fetchCompaniesRequests() async {
    isLoading.value = true;
    try {
      var token = await storage.read("token");
      if (token != null) {
        var consultationRequests = await serviceDisplay.displayConsultationRequests(token);
        companiesRequests.value = consultationRequests.companyConsultation;
      } else {
        print('Token is null');
      }
    } catch (e) {
      print('Error fetching consultation requests: $e');
    }
    isLoading.value = false;
  }
}