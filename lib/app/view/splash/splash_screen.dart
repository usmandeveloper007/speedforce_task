import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hiring_task/app/resources/app_colors.dart';
import 'package:hiring_task/app/resources/app_images.dart';
import 'package:hiring_task/app/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigationToDashboard();
    super.initState();
  }

  void navigationToDashboard() {
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed(RouteNames.logInScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.appLogo,
              scale: 5,
            ),
          ).paddingOnly(top: 200),
          SpinKitCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(color: AppColors.primaryColor),
              );
            },
          ).paddingOnly(top: 200),
        ],
      ),
    );
  }
}
