import 'package:advisor_graduation_project/appRoute.dart';
import 'package:advisor_graduation_project/bindings/allBindings.dart';
import 'package:advisor_graduation_project/language/local.dart';
import 'package:advisor_graduation_project/language/localController.dart';
import 'package:advisor_graduation_project/modules/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  Get.put(LocaleController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controllerLang = Get.put(LocaleController());
    return GetMaterialApp(
      initialBinding: allBindings(),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Final Project',
      locale: controllerLang.currentLang,
      translations: MyLocal(),
      getPages: appPages,
       initialRoute: '/splash',
      // home: HomeScreen(),
    );
  }
}
