import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? iconPath;
  final String? suffixIconPath;
  final String fieldType;
  final bool? isPasswordVisible;
  final Function()? onTapPassword;

  const CustomTextField({
    required this.controller,
    required this.label,
    required this.iconPath,
    required this.fieldType,
    super.key,
    this.isPasswordVisible,
    this.onTapPassword,
    this.suffixIconPath,
  });

  String? _validate(String? value) {
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
          child: TextFormField(
            controller: controller,
            obscureText: fieldType == 'password',
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
                suffixIcon: fieldType == 'password'
                    ? IconButton(
                        icon: Icon(
                          isPasswordVisible!
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          onTapPassword!();
                        },
                      )
                    : fieldType == 'other' || fieldType == 'email'
                        ? (suffixIconPath != null)
                            ? Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset(
                                  suffixIconPath!,
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.contain,
                                ),
                              )
                            : null
                        : null,
                hintText: label,
                hintStyle: TextStyle(
                  fontSize: 15,
                  fontFamily: "Urbanist",
                )),
            validator: _validate,
          ).paddingSymmetric(horizontal: 20, vertical: 10),
        ),
      ],
    );
  }
}
