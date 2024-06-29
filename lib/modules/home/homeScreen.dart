import 'package:advisor_graduation_project/constants.dart';
import 'package:advisor_graduation_project/modules/companies_requests/companiesRequestsScreen.dart';
import 'package:advisor_graduation_project/modules/home/homeController.dart';
import 'package:advisor_graduation_project/modules/notifications/notificationsScreen.dart';
import 'package:advisor_graduation_project/modules/settings/settingsScreen.dart';
import 'package:advisor_graduation_project/modules/users_requests/usersRequestsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends GetView<HomeController> {

  final List<Widget> screens = <Widget>[
    CompaniesRequestsScreen(),
    UsersRequestsScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[controller.currentIndex.value]),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: primaryGreenColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GNav(
              tabBorderRadius: 10,
              tabActiveBorder: Border.all(
                color: primaryWhiteColor,
                width: 1,
              ),
              curve: Curves.easeOutExpo,
              duration: Duration(milliseconds: 500),
              color: secondaryWhiteColor,
              activeColor: primaryWhiteColor,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              selectedIndex: controller.currentIndex.value,
              onTabChange: (index) {
                controller.changeIndex(index);
              },
              tabs: [
                GButton(
                  icon: Icons.apartment,
                  text: 'companies requests'.tr,
                  textStyle: TextStyle(
                    fontFamily: 'Roboto',
                    color: primaryWhiteColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GButton(
                  icon: Icons.group,
                  text: 'users requests'.tr,
                  textStyle: TextStyle(
                    fontFamily: 'Roboto',
                    color: primaryWhiteColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GButton(
                  icon: Icons.notifications_on_rounded,
                  text: 'notifications'.tr,
                  textStyle: TextStyle(
                    fontFamily: 'Roboto',
                    color: primaryWhiteColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'settings'.tr,
                  textStyle: TextStyle(
                    fontFamily: 'Roboto',
                    color: primaryWhiteColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
