import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_task/app/controllers/auth_controller.dart';
import 'package:hiring_task/app/resources/app_colors.dart';
import 'package:hiring_task/app/resources/app_images.dart';
import 'package:hiring_task/app/resources/app_strings.dart';
import 'package:hiring_task/app/resources/media_extension.dart';
import 'package:hiring_task/app/routes/route_names.dart';
import 'package:hiring_task/app/service/internet_connectivity_service.dart';
import 'package:hiring_task/app/widgets/app_text.dart';
import 'package:hiring_task/app/widgets/custom_button.dart';
import 'package:hiring_task/app/widgets/custom_text_field.dart';
import 'widgets/consumer_service_selecter_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  AuthController authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  ConnectivityService connectivityService = ConnectivityService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // consumer or service provider
              ConsumerServiceSelecterWidget(),
              CustomTextField(
                controller: authController.firstNameController,
                label: AppString.firstName,
                iconPath: null,
                validator: (value) {
                  return authController.validate(
                      value, "other", AppString.firstName);
                },
                fieldType: "other",
              ).paddingOnly(top: 20),
              CustomTextField(
                controller: authController.lastNameController,
                label: AppString.lastName,
                iconPath: null,
                validator: (value) {
                  return authController.validate(
                      value, "other", AppString.lastName);
                },
                fieldType: "other",
              ).paddingOnly(top: 20),
              CustomTextField(
                controller: authController.emailController,
                label: AppString.email,
                iconPath: null,
                validator: (value) {
                  return authController.validate(
                      value, "email", AppString.email);
                },
                suffixIconPath: AppIcons.emailIcon,
                fieldType: "email",
              ).paddingOnly(top: 20, bottom: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonFormField<String>(
                  value: authController.selectedGender.value,
                  onChanged: (value) {
                    if (value != null) {
                      authController.updateGender(value);
                    }
                  },
                  iconEnabledColor: AppColors.secondaryColor,
                  iconDisabledColor: AppColors.primaryColor,
                  icon: Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 32,
                  ),
                  iconSize: 32,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CountryCodePicker(
                    iconEnabledColor: AppColors.secondaryColor,
                    iconDisabledColor: AppColors.secondaryColor,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.secondaryColor,
                      size: 32,
                    ),
                    hideMainText: true,
                  ),
                  Expanded(
                    child: CustomTextField(
                      controller: authController.phoneNumberController,
                      label: AppString.phoneNumber,
                      iconPath: null,
                      validator: (value) {
                        return authController.validate(
                            value, "other", AppString.phoneNumber);
                      },
                      fieldType: "other",
                    ),
                  )
                ],
              ).paddingOnly(top: 20),
              CustomTextField(
                controller: authController.passwordController,
                label: AppString.password,
                iconPath: null,
                validator: (value) {
                  return authController.validate(
                      value, "password", AppString.firstName);
                },
                fieldType: "password",
              ).paddingOnly(top: 20),
              CustomTextField(
                controller: authController.confirmPasswordController,
                label: AppString.confirmPassword,
                iconPath: null,
                validator: (value) {
                  return authController.validate(
                      value, "password", AppString.firstName);
                },
                fieldType: "password",
              ).paddingOnly(top: 20, bottom: 20),
              RichText(
                text: TextSpan(
                    text: AppString.continuingAgreement,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "Urbanist",
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: AppString.termsOfService,
                        style: TextStyle(
                            color: AppColors.homeBtnTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: AppString.and,
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                          text: AppString.privacyPolicy,
                          style: TextStyle(
                              color: AppColors.homeBtnTextColor,
                              fontWeight: FontWeight.w500))
                    ]),
              ),
              CustomButton(
                onTap: () async {
                  final hasInternet = await connectivityService
                      .checkConnectionStatus(verifyIt: true);
                  if (hasInternet == false) {
                    Get.snackbar("Internet Alert", "No Internet Connection!");
                    return;
                  }
                  if (_formKey.currentState!.validate()) {
                    Get.toNamed(RouteNames.dashBoardScreen);
                  }
                },
                title: AppString.signUp,
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
                    width: 60,
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
                    width: 60,
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
                            Get.toNamed(RouteNames.logInScreen);
                          },
                        text: AppString.logIn,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontFamily: "Urbanist",
                        ))
                  ],
                ),
              ).paddingOnly(top: 30),
            ],
          ).paddingSymmetric(horizontal: 20, vertical: 20),
        ),
      ),
    );
  }
}
