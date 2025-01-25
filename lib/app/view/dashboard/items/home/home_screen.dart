import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_task/app/resources/app_colors.dart';
import 'package:hiring_task/app/resources/app_images.dart';
import 'package:hiring_task/app/resources/app_strings.dart';
import 'package:hiring_task/app/resources/media_extension.dart';
import 'package:hiring_task/app/widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: context.screenHeight * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: "Hello!",
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          isPrimaryFont: true,
                          textColor: AppColors.whiteColor,
                          textAlign: TextAlign.start,
                        ),
                        AppText(
                          title: "David Methew",
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          isPrimaryFont: true,
                          textColor: AppColors.whiteColor,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.whiteColor,
                      child: Icon(
                        Icons.person,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: context.screenWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.earningBannerImage),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: AppString.myEarnings,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          isPrimaryFont: true,
                          textColor: AppColors.blackColor,
                          textAlign: TextAlign.left,
                        ),
                        AppText(
                          title: "\$9,545",
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          isPrimaryFont: true,
                          textColor: AppColors.primaryColor,
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          height: context.screenHeight * 0.05,
                          width: context.screenWidth * 0.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.homeBtnColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: AppText(
                              title: AppString.details,
                              fontSize: 14,
                              isPrimaryFont: true,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.homeBtnTextColor,
                              textAlign: TextAlign.center),
                        ).paddingOnly(top: 17),
                      ],
                    ).paddingOnly(left: 20, top: 15),
                  ).paddingOnly(top: 20),
                ),
              ],
            ).paddingSymmetric(horizontal: 15, vertical: 40),
          ),
          Column(
            children: [
              Image.asset(AppImages.inviteFriendsImage, scale: 4)
                  .paddingOnly(top: 20),
              AppText(
                title: AppString.inviteYourFriends.tr,
                fontSize: 28,
                fontWeight: FontWeight.w800,
                isPrimaryFont: true,
                textColor: AppColors.blackColor,
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: 30, vertical: 20),
              AppText(
                title: AppString.invitationDescription.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                isPrimaryFont: true,
                textColor: AppColors.blackColor,
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: 15),
              Container(
                height: context.screenHeight * 0.07,
                width: context.screenWidth,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.copy,
                      size: 22,
                      color: AppColors.whiteColor,
                    ).paddingOnly(right: 20),
                    AppText(
                      title: AppString.copyReferralLink,
                      fontSize: 18,
                      textColor: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      isPrimaryFont: true,
                    ),
                  ],
                ),
              ).paddingOnly(top: 20),
              AppText(
                title: AppString.sendTo,
                fontSize: 18,
                textColor: AppColors.blackColor,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                isPrimaryFont: true,
              ).paddingOnly(top: 20),
              Container(
                height: context.screenHeight * 0.07,
                width: context.screenWidth,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border: Border.all(
                      width: 2,
                      color: AppColors.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppIcons.referralIcon,
                      scale: 3,
                    ).paddingOnly(right: 20),
                    AppText(
                      title: AppString.sendReferralLink,
                      fontSize: 18,
                      textColor: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      isPrimaryFont: true,
                    ),
                  ],
                ),
              ).paddingOnly(top: 20),
            ],
          ).paddingSymmetric(horizontal: 15),
        ],
      ),
    );
  }
}
