import 'package:flutter/material.dart';
import 'package:hiring_task/app/resources/app_colors.dart';
import 'package:hiring_task/app/widgets/app_text.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Function() onTap;
  final double fontSize;
  const CustomButton({
    super.key,
    required this.title,
    required this.textColor,
    required this.onTap,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: AppText(
            title: title,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            isPrimaryFont: true,
            textColor: textColor,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
