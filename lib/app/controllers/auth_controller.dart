import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_task/app/models/login_model.dart';
import 'package:hiring_task/app/service/login_api_service.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // account creation type
  RxBool isConsumerSelected = false.obs;
  void updateAccountCreationType(bool value) {
    isConsumerSelected.value = value;
  }

  // login controller

  RxString response = ''.obs;
  Future<String> loginUser() async {
    // Fetch data from the API
    final LoginApiModel? loginData = await LoginApiService.fetchLoginData();

    // Log API and user input emails
    log("api email : ${loginData?.data?.email} and controller email : ${emailController.text}");

    // Check if API returned valid data
    if (loginData == null || loginData.data == null) {
      response.value = "Failed to fetch user data.";
      return response.value;
    }

    // Compare user input with the fetched email (trimmed and lowercased)
    final apiEmail = loginData.data!.email?.trim().toLowerCase();
    final userEmail = emailController.text.trim().toLowerCase();

    if (userEmail == apiEmail) {
      response.value = "Login Successful!";
      return response.value;
    } else {
      response.value = "Invalid Email. Please try again.";
      return response.value;
    }
  }
}
