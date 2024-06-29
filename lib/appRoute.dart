import 'package:advisor_graduation_project/modules/company_messages/companyMessagesScreen.dart';
import 'package:advisor_graduation_project/modules/company_profile/companyProfileScreen.dart';
import 'package:advisor_graduation_project/modules/course_details/courseDetailsScreen.dart';
import 'package:advisor_graduation_project/modules/home/homeScreen.dart';
import 'package:advisor_graduation_project/modules/job_details/jobDetailsScreen.dart';
import 'package:advisor_graduation_project/modules/login/loginScreen.dart';
import 'package:advisor_graduation_project/modules/reply_to_company/replyToCompanyScreen.dart';
import 'package:advisor_graduation_project/modules/splash/splashScreen.dart';
import 'package:advisor_graduation_project/modules/user_messages/userMessagesScreen.dart';
import 'package:advisor_graduation_project/modules/reply_to_user/replyToUserScreen.dart';
import 'package:advisor_graduation_project/modules/user_profile/userProfileScreen.dart';
import 'package:get/get.dart';


List<GetPage> appPages = [

  GetPage(name: '/login', page: () => LoginScreen()),
  GetPage(name: '/splash', page: () => SplashScreen()),
  GetPage(name: '/home', page: () => HomeScreen()),
  GetPage(name: '/userMessages', page: () => UserMessagesScreen()),
  GetPage(name: '/companyMessages', page: () => CompanyMessagesScreen()),
  GetPage(name: '/replyToUser', page: () => ReplyToUserScreen()),
  GetPage(name: '/replyToCompany', page: () => ReplyToCompanyScreen()),
  GetPage(name: '/companyProfile', page: () => CompanyProfileScreen()),
  GetPage(name: '/jobDetails', page: () => JobDetailsScreen()),
  GetPage(name: '/courseDetails', page: () => CourseDetailsScreen()),
  GetPage(name: '/userProfile', page: () => UserProfileScreen()),

];
