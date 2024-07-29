import 'package:flutter/material.dart';
import 'package:manfaa/core/theme/colors/app_colors.dart';
import 'package:manfaa/core/theme/text_styles/app_text_styles.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.height,
    this.onPressed,
    this.text,
    this.borderRadius,
    this.textStyle,
    this.color,
    this.overlayColor,
  });

  final String? text;
  final double? height;
  final void Function()? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;
  final Color? color;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          overlayColor: MaterialStateProperty.all(
            overlayColor ?? AppColors.f0c271.withOpacity(0.2),
          ),
          backgroundColor: MaterialStateProperty.all(color ?? AppColors.f0c271),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            ),
          ),
        ),
        child: Text(
          text ?? '',
          style: textStyle ?? AppTextStyles.blackSize16Weight600,
        ),
      ),
    );
  }
}
