import 'package:advisor_graduation_project/modules/companies_requests/companiesRequestsController.dart';
import 'package:advisor_graduation_project/modules/home/homeController.dart';
import 'package:advisor_graduation_project/modules/login/loginController.dart';
import 'package:advisor_graduation_project/modules/reply_to_company/replyToCompanyController.dart';
import 'package:advisor_graduation_project/modules/settings/settingsController.dart';
import 'package:advisor_graduation_project/modules/splash/splashController.dart';
import 'package:advisor_graduation_project/modules/user_messages/userMessagesController.dart';
import 'package:advisor_graduation_project/modules/users_requests/userRequestsController.dart';
import 'package:advisor_graduation_project/modules/reply_to_user/replyToUserController.dart';

import 'package:get/get.dart';

class allBindings extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SplashController());
    Get.put(HomeController());
    Get.put(SettingsController());
    Get.put(CompaniesRequestsController());
    Get.put(UserRequestsController());
    Get.lazyPut(() => UserMessagesController());
    Get.lazyPut(() => CompaniesRequestsController());
    Get.lazyPut(() => ReplyToUserController());
    Get.lazyPut(() => ReplyToCompanyController());

  }
}