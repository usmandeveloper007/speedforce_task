import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_task/app/controllers/auth_controller.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? iconPath;
  final String? suffixIconPath;
  final String fieldType;
  final String? Function(String?)? validator;

  CustomTextField({
    required this.controller,
    required this.label,
    required this.iconPath,
    required this.fieldType,
    super.key,
    this.suffixIconPath,
    this.validator,
  });

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: fieldType == 'password'
              ? Obx(() {
                  return TextFormField(
                    controller: controller,
                    obscureText: authController.isPasswordSeen.value,
                    decoration: InputDecoration(
                      prefixIcon: iconPath != null
                          ? Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                iconPath!,
                                width: 15,
                                height: 15,
                                fit: BoxFit.contain,
                              ),
                            )
                          : null,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      suffixIcon: IconButton(
                        icon: Icon(
                          authController.isPasswordSeen.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          authController.updatePasswordSecure();
                        },
                      ),
                      hintText: label,
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        fontFamily: "Urbanist",
                      ),
                    ),
                    validator: validator,
                  );
                })
              : TextFormField(
                  controller: controller,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: iconPath != null
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              iconPath!,
                              width: 15,
                              height: 15,
                              fit: BoxFit.contain,
                            ),
                          )
                        : null,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    suffixIcon: suffixIconPath != null
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              suffixIconPath!,
                              width: 15,
                              height: 15,
                              fit: BoxFit.contain,
                            ),
                          )
                        : null,
                    hintText: label,
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontFamily: "Urbanist",
                    ),
                  ),
                  validator: validator,
                ),
        ),
      ],
    );
  }
}
