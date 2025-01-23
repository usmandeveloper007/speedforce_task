import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_task/app/controllers/auth_controller.dart';
import 'package:hiring_task/app/resources/app_colors.dart';
import 'package:hiring_task/app/resources/app_images.dart';
import 'package:hiring_task/app/resources/app_strings.dart';
import 'package:hiring_task/app/resources/media_extension.dart';
import 'package:hiring_task/app/routes/route_names.dart';
import 'package:hiring_task/app/widgets/app_text.dart';
import 'package:hiring_task/app/widgets/custom_button.dart';
import 'package:hiring_task/app/widgets/custom_checkbox_widget.dart';
import 'package:hiring_task/app/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.appLogo,
              scale: 6,
            ).paddingOnly(top: 60, bottom: 20),
          ),
          AppText(
            title: AppString.welcomeBack,
            fontSize: 22,
            isPrimaryFont: true,
            fontWeight: FontWeight.w700,
            textColor: AppColors.blackColor,
            textAlign: TextAlign.center,
          ),
          CustomTextField(
            controller: authController.emailController,
            fieldType: "email",
            label: AppString.email,
            iconPath: AppIcons.emailIcon,
          ).paddingOnly(bottom: 15),
          CustomTextField(
            controller: authController.passwordController,
            fieldType: "password",
            label: AppString.password,
            iconPath: AppIcons.passwordIcon,
            isPasswordVisible: false,
            onTapPassword: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCheckboxWidget(
                value: true,
                onChanged: (value) {},
              ).paddingOnly(right: 20),
              AppText(
                title: AppString.rememberMe,
                fontSize: 18,
                isPrimaryFont: true,
                fontWeight: FontWeight.w700,
                textColor: AppColors.blackColor,
                textAlign: TextAlign.center,
              )
            ],
          ).paddingOnly(
            top: 50,
          ),
          CustomButton(
            onTap: () {
              log("me");
              authController.loginUser().then((value) {
                log(authController.response.value);
                Get.snackbar("Api Response", authController.response.value);
              });
            },
            title: AppString.logIn,
            textColor: AppColors.whiteColor,
            fontSize: 22,
          ).paddingSymmetric(horizontal: 15, vertical: 20),
          AppText(
            title: AppString.forgetPassword,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            isPrimaryFont: true,
            textColor: AppColors.primaryColor,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
              ).paddingOnly(right: 20),
              AppText(
                title: AppString.orContinueWith,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                isPrimaryFont: true,
                textColor: AppColors.blackColor,
                textAlign: TextAlign.center,
              ),
              Container(
                width: 80,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
              ).paddingOnly(left: 20),
            ],
          ).paddingOnly(top: 50, bottom: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: context.screenHeight * 0.075,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    AppIcons.facebookIcon,
                    scale: 3,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: context.screenHeight * 0.075,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    AppIcons.googleIcon,
                    scale: 3,
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 40),
          RichText(
            text: TextSpan(
              text: AppString.dontHaveAccount,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "Urbanist",
                fontWeight: FontWeight.w500,
              ),
              children: <TextSpan>[
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(RouteNames.signUpScreen);
                      },
                    text: AppString.signUp,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontFamily: "Urbanist",
                    ))
              ],
            ),
          ).paddingOnly(top: 30),
        ],
      ),
    );
  }
}
