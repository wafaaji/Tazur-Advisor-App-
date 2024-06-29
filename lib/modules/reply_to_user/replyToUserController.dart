import 'package:advisor_graduation_project/model/replyToUser.dart';
import 'package:advisor_graduation_project/modules/reply_to_user/replyToUserServices.dart';
import 'package:advisor_graduation_project/native-services/secureStorage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReplyToUserController extends GetxController {
  RxInt requestId = 0.obs;
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;

  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Reply
  late TextEditingController replyController;
  var reply = '';
  late ReplyToUserServices replyService;
  var replyStatus = false;
  var message;

  @override
  void onInit() {
    replyController = TextEditingController();
    replyService = ReplyToUserServices();

    processReplyToUser(Get.arguments);
    print('Received request id: $requestId');
    super.onInit();
  }

  @override
  void onClose() {
    replyController.dispose();
    super.onClose();
  }

  String? validateReply (String value) {
    if (value.isEmpty) {
      return 'empty reply'.tr;
    }
    return null;
  }

  // For Reply API
  Future<void> replyOnClick() async {
    reply = replyController.text;
    try {
      var token = await storage.read("token");
      ReplyToUserModel replyToUser = ReplyToUserModel(
        reply: reply,
      );

      replyStatus = await replyService.replyToUser(token, replyToUser, requestId.value);
      message = replyService.message;

      if (message is List) {
        String temp = '';
        for (String s in message)
          temp += s + "\n";
        message = temp;
      }
    } catch (e) {
      print("Error Reply: $e");
      message = 'Error reply to user: $e'.tr;
    }
  }

  // Method in the controller that receives arguments
  void processReplyToUser(int requestId) {
    this.requestId.value = requestId;
    print('Received request id: $requestId');
  }
}