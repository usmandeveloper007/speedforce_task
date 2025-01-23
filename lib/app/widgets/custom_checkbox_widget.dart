import 'package:flutter/material.dart';
import 'package:hiring_task/app/resources/app_colors.dart';

class CustomCheckboxWidget extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const CustomCheckboxWidget(
      {super.key, required this.value, required this.onChanged});

  @override
  State<CustomCheckboxWidget> createState() => _CustomCheckboxWidgetState();
}

class _CustomCheckboxWidgetState extends State<CustomCheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: widget.value ? AppColors.primaryColor : Colors.transparent,
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: widget.value
            ? Icon(
                Icons.check,
                size: 18,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
