import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String title;
  final double fontSize;
  final bool isPrimaryFont;
  final FontWeight fontWeight;
  final Color textColor;
  final TextAlign textAlign;

  const AppText(
      {super.key,
      required this.title,
      required this.fontSize,
      required this.isPrimaryFont,
      required this.fontWeight,
      required this.textColor,
      required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
        fontFamily: isPrimaryFont ? 'Urbanist' : '',
      ),
      textAlign: textAlign,
    );
  }
}
