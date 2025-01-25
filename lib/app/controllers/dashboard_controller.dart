import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_task/app/resources/app_colors.dart';
import 'package:hiring_task/app/view/dashboard/items/earnings/earnings_screen.dart';
import 'package:hiring_task/app/view/dashboard/items/home/home_screen.dart';
import 'package:hiring_task/app/view/dashboard/items/jobs/jobs_screen.dart';
import 'package:hiring_task/app/view/dashboard/items/profile/profile_screen.dart';

class DashboardController extends GetxController {
  RxInt selectedBottomNav = 0.obs;
  void onTapBottomNav(int value) {
    selectedBottomNav.value = value;
  }

  final pages = [
    HomeScreen(),
    JobsScreen(),
    EarningsScreen(),
    ProfileScreen(),
  ];

  Color getBottomNavImageColor(int index) {
    return selectedBottomNav.value == index
        ? AppColors.primaryColor
        : Colors.grey;
  }
}
