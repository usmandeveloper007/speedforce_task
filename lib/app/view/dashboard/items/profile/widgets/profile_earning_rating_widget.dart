import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_task/app/resources/app_colors.dart';
import 'package:hiring_task/app/resources/app_images.dart';
import 'package:hiring_task/app/resources/app_strings.dart';
import 'package:hiring_task/app/resources/media_extension.dart';
import 'package:hiring_task/app/widgets/app_text.dart';

class ProfileEarningRatingWidget extends StatelessWidget {
  final String earnings;
  final String ratings;
  const ProfileEarningRatingWidget(
      {super.key, required this.earnings, required this.ratings});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: context.screenHeight * 0.1,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  title: AppString.earning,
                  fontSize: 16,
                  textColor: Colors.grey,
                  fontWeight: FontWeight.w500,
                  isPrimaryFont: true,
                  textAlign: TextAlign.center,
                ).paddingOnly(bottom: 5),
                AppText(
                  title: earnings,
                  fontSize: 16,
                  textColor: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                  isPrimaryFont: true,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            height: context.screenHeight * 0.1,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  title: AppString.ratings,
                  fontSize: 16,
                  textColor: Colors.grey,
                  fontWeight: FontWeight.w500,
                  isPrimaryFont: true,
                  textAlign: TextAlign.center,
                ).paddingOnly(bottom: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppIcons.reviewIcon, scale: 3)
                        .paddingOnly(right: 10),
                    AppText(
                      title: ratings,
                      fontSize: 16,
                      textColor: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                      isPrimaryFont: true,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ).paddingOnly(top: 20);
  }
}
