import 'package:flutter/material.dart';
import 'package:hiring_task/app/resources/app_colors.dart';
import 'package:hiring_task/app/widgets/app_text.dart';

class ProfileTilesWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  const ProfileTilesWidget({
    super.key,
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        ListTile(
          leading: Image.asset(
            iconPath,
            scale: 4,
          ),
          title: AppText(
            title: title,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            isPrimaryFont: true,
            textAlign: TextAlign.left,
            textColor: AppColors.blackColor,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: AppColors.secondaryColor,
          ),
        )
      ],
    );
  }
}
