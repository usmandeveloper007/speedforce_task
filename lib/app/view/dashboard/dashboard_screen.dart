import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_task/app/controllers/dashboard_controller.dart';
import 'package:hiring_task/app/resources/app_colors.dart';
import 'package:hiring_task/app/resources/app_images.dart';
import 'package:hiring_task/app/resources/app_strings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardController dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return dashboardController
            .pages[dashboardController.selectedBottomNav.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.whiteColor,
          currentIndex: dashboardController.selectedBottomNav.value,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          selectedIconTheme:
              const IconThemeData(color: AppColors.primaryColor, size: 20),
          unselectedIconTheme:
              const IconThemeData(color: Colors.grey, size: 20),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: dashboardController.onTapBottomNav,
          items: [
            BottomNavigationBarItem(
              label: AppString.home,
              icon: _getIconForState(
                  AppIcons.homeSelectedIcon, AppIcons.homeIcon, 0),
            ),
            BottomNavigationBarItem(
              label: AppString.jobs,
              icon: _getIconForState(
                  AppIcons.jobSelectedIcon, AppIcons.jobIcon, 1),
            ),
            BottomNavigationBarItem(
              label: AppString.earning,
              icon: _getIconForState(
                  AppIcons.earningSelectedIcon, AppIcons.earningIcon, 2),
            ),
            BottomNavigationBarItem(
              label: AppString.profile,
              icon: _getIconForState(
                  AppIcons.profileSelectedIcon, AppIcons.profileIcon, 3),
            ),
          ],
        );
      }),
    );
  }

  Widget _getIconForState(
      String selectedAsset, String unselectedAsset, int index) {
    bool isSelected = dashboardController.selectedBottomNav.value == index;
    return Image.asset(
      isSelected ? selectedAsset : unselectedAsset,
      scale: 4,
    );
  }
}
