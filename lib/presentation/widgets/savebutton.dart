import 'package:flutter/material.dart';
import 'package:student_management/utils/colors.dart';

class SaveButton extends StatelessWidget {
  final double? width;
  final String? text;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final VoidCallback? onPressed;

  const SaveButton(
      {super.key,
      this.width,
      this.height,
      this.backgroundColor,
      this.textColor,
      this.borderRadius,
      this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SizedBox(
        width: 150,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
              ),
            ),
          ),
          child:  Text(text!),
        ),
      ),
    );
  }
}
