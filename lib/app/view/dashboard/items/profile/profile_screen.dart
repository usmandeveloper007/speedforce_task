import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_task/app/controllers/api_data_controller.dart';
import 'package:hiring_task/app/resources/app_colors.dart';
import 'package:hiring_task/app/resources/app_images.dart';
import 'package:hiring_task/app/resources/app_strings.dart';
import 'package:hiring_task/app/resources/media_extension.dart';
import 'package:hiring_task/app/view/dashboard/items/profile/widgets/profile_earning_rating_widget.dart';
import 'package:hiring_task/app/widgets/app_text.dart';
import 'widgets/profile_tiles_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ApiDataController apiDataController = Get.find<ApiDataController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                title: AppString.myProfile,
                fontSize: 18,
                isPrimaryFont: true,
                fontWeight: FontWeight.w500,
                textColor: AppColors.blackColor,
                textAlign: TextAlign.right,
              ),
              Icon(Icons.menu)
            ],
          ).paddingOnly(top: 50),
          Container(
            height: context.screenHeight * 0.2,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.avatarBgImage))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 110,
                  width: 110,
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          apiDataController.avatarUrl.value.toString(),
                          scale: 1,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppIcons.editImageIcon)),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                AppText(
                  title: apiDataController.fullName.value,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.blackColor,
                  isPrimaryFont: true,
                  textAlign: TextAlign.center,
                ).paddingOnly(top: 10)
              ],
            ),
          ).paddingOnly(top: 20),
          Center(
            child: AppText(
              title: apiDataController.emailAddress.value,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              textColor: AppColors.blackColor,
              isPrimaryFont: true,
              textAlign: TextAlign.center,
            ).paddingOnly(top: 5),
          ),
          ProfileEarningRatingWidget(earnings: "\$9500", ratings: "4.5"),
          AppText(
            title: "About Me",
            fontSize: 16,
            textColor: AppColors.blackColor,
            fontWeight: FontWeight.w700,
            isPrimaryFont: true,
            textAlign: TextAlign.center,
          ).paddingSymmetric(vertical: 10),
          AppText(
            title: apiDataController.aboutMe.value,
            fontSize: 14,
            textColor: AppColors.blackColor,
            fontWeight: FontWeight.w400,
            isPrimaryFont: true,
            textAlign: TextAlign.left,
          ).paddingSymmetric(vertical: 10),
          ProfileTilesWidget(
              iconPath: AppIcons.locationIcon,
              title: AppString.businessLocation),
          ProfileTilesWidget(
              iconPath: AppIcons.walletIcon, title: AppString.bookings),
          ProfileTilesWidget(
              iconPath: AppIcons.myServicesIcon, title: AppString.myServices),
        ],
      ).paddingSymmetric(horizontal: 15),
    );
  }
}
