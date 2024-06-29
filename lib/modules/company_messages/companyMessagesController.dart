import 'package:advisor_graduation_project/model/companyMessages.dart';
import 'package:advisor_graduation_project/modules/company_messages/companyMessagesServices.dart';
import 'package:advisor_graduation_project/native-services/secureStorage.dart';
import 'package:get/get.dart';

class CompanyMessagesController extends GetxController {

  RxInt companyId = 0.obs;
  RxInt requestId = 0.obs;
  // For Course Details API
  SecureStorage storage = SecureStorage();

  // For Get Company Messages
  late CompanyMessagesServices service;
  RxList<CompanyMessages> companyMessages = <CompanyMessages>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    service = CompanyMessagesServices();
    // For Get Company Messages
    fetchCompanyMessages();

    if (Get.arguments != null && Get.arguments is List && Get.arguments.length == 2) {
      var args = Get.arguments as List;
      processCompanyMessages(args[0], args[1]);
    }
    print('Received company id: $companyId');
    print('Received request id: $requestId');
    super.onInit();
  }

  void fetchCompanyMessages() async {
    try {
      isLoading.value = true;
      var token = await storage.read("token");
      if (token != null) {
        var messages = await service.displayCompanyMessages(token, companyId.value);
        companyMessages.value = messages;
      }
    } catch (e) {
      print('Error fetching company messages: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Method in the controller that receives arguments
  void processCompanyMessages(int companyId, int requestId) {
    this.companyId.value = companyId;
    this.requestId.value = requestId;
    print('Received company id: $companyId');
    print('Received request id: $requestId');
  }

}