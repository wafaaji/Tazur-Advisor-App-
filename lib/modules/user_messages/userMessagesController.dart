import 'package:advisor_graduation_project/model/userMessages.dart';
import 'package:advisor_graduation_project/modules/user_messages/userMessagesServices.dart';
import 'package:advisor_graduation_project/native-services/secureStorage.dart';
import 'package:get/get.dart';

class UserMessagesController extends GetxController {

  RxInt userId = 0.obs;
  RxInt requestId = 0.obs;
  // For Course Details API
  SecureStorage storage = SecureStorage();

  // For Get User Messages
  late UserMessagesServices service;
  RxList<UserMessages> userMessages = <UserMessages>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    service = UserMessagesServices();
    // For Get User Messages
    fetchUserMessages();

    if (Get.arguments != null && Get.arguments is List && Get.arguments.length == 2) {
      var args = Get.arguments as List;
      processUserMessages(args[0], args[1]);
    }
    print('Received user id: $userId');
    print('Received request id: $requestId');
    super.onInit();
  }

  void fetchUserMessages() async {
    try {
      isLoading.value = true;
      var token = await storage.read("token");
      if (token != null) {
        var messages = await service.displayUserMessages(token, userId.value);
        userMessages.value = messages;
      }
    } catch (e) {
      print('Error fetching user messages: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Method in the controller that receives arguments
  void processUserMessages(int userId, int requestId) {
    this.userId.value = userId;
    this.requestId.value = requestId;
    print('Received user id: $userId');
    print('Received request id: $requestId');
  }

}