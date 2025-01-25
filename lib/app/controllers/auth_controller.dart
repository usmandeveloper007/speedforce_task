import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_task/app/models/login_model.dart';
import 'package:hiring_task/app/routes/route_names.dart';
import 'package:hiring_task/app/service/login_api_service.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  RxBool isPasswordSeen = true.obs;
  RxBool isRememberMe = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // account creation type
  RxBool isConsumerSelected = false.obs;
  void updateAccountCreationType(bool value) {
    isConsumerSelected.value = value;
  }

  void updatePasswordSecure() {
    isPasswordSeen.value = !isPasswordSeen.value;
    log("controller : ${isPasswordSeen.value.toString()}");
  }

  void updateRememberMe(bool value) {
    log(value.toString());
    log(isRememberMe.value.toString());
    isRememberMe.value = value;
  }

  // login controller

  RxString response = ''.obs;
  Future<String> loginUser() async {
    final LoginApiModel? loginData = await LoginApiService.fetchLoginData();

    if (loginData == null || loginData.data == null) {
      response.value = "Failed to fetch user data.";
      return response.value;
    }

    final apiEmail = loginData.data!.email?.trim().toLowerCase();
    final userEmail = emailController.text.trim().toLowerCase();
    log("api email : $apiEmail and controller email : $userEmail");
    if (apiEmail == userEmail && passwordController.text.trim() == "password") {
      response.value = "Login Successful!";
      Get.toNamed(RouteNames.dashBoardScreen);
      return response.value;
    } else {
      response.value = "Invalid Email. Please try again.";
      return response.value;
    }
  }

  //
  String? validate(String? value, String fieldType, String label) {
    if (value == null || value.isEmpty) {
      return '$label is required';
    }

    if (fieldType == 'email') {
      // Email validation
      if (!GetUtils.isEmail(value)) {
        return 'Please enter a valid email address';
      }
    } else if (fieldType == 'password') {
      // Password validation
      if (value.length < 6) {
        return 'Password must be at least 6 characters long';
      }
    }

    return null;
  }

  void clearTextController() {
    emailController.clear();
    passwordController.clear();
  }

  var selectedGender = 'Male'.obs;

  void updateGender(String gender) {
    selectedGender.value = gender;
  }
}
