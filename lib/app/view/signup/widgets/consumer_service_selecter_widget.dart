import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_task/app/controllers/auth_controller.dart';
import 'package:hiring_task/app/resources/app_colors.dart';
import 'package:hiring_task/app/resources/app_strings.dart';
import 'package:hiring_task/app/resources/media_extension.dart';
import 'package:hiring_task/app/widgets/app_text.dart';

class ConsumerServiceSelecterWidget extends StatelessWidget {
  ConsumerServiceSelecterWidget({super.key});
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.07,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Obx(() {
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  authController.updateAccountCreationType(true);
                },
                child: Container(
                  height: context.screenHeight * 0.07,
                  decoration: BoxDecoration(
                      color: authController.isConsumerSelected.value
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: AppText(
                      title: AppString.consumer,
                      fontSize: 20,
                      textColor: authController.isConsumerSelected.value
                          ? AppColors.whiteColor
                          : AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      isPrimaryFont: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  authController.updateAccountCreationType(false);
                },
                child: Container(
                  height: context.screenHeight * 0.07,
                  decoration: BoxDecoration(
                      color: !authController.isConsumerSelected.value
                          ? AppColors.primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: AppText(
                      title: AppString.serviceProvider,
                      fontSize: 20,
                      textColor: !authController.isConsumerSelected.value
                          ? AppColors.whiteColor
                          : AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      isPrimaryFont: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    ).paddingOnly(top: 100);
  }
}
