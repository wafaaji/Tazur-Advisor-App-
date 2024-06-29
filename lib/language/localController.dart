import 'package:advisor_graduation_project/native-services/secureStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  final SecureStorage storage = SecureStorage();
  late Locale currentLang;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _initializeLang();
  }

  Future<void> _initializeLang() async {
    String? langCode = await storage.read('lang');
    currentLang = Locale(langCode ?? 'ar');
    print('Current language loaded: $currentLang');
    update(); // Notify listeners that currentLang has been updated
  }

  void changeLang() {
    String newLangCode = currentLang.languageCode == 'en' ? 'ar' : 'en';
    currentLang = Locale(newLangCode);
    storage.save('lang', newLangCode);
    print('Language changed to: $currentLang');
    Get.updateLocale(currentLang);
    update(); // Notify listeners that currentLang has been updated
  }
}