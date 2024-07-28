import 'package:flutter/material.dart';
import 'package:vaynow_flutter/component/theme.dart';
import 'package:vaynow_flutter/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color colorText;
  final Color? colorBorder;
  final Color? backgroundColors;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontTextSize;
  final TextStyle? textStyle;

  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.colorText,
      this.backgroundColors,
      this.width,
      this.borderRadius,
      this.textStyle,
      this.fontTextSize,
      this.height,
      this.colorBorder});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 43.0,
        alignment: Alignment.center,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            color: backgroundColors ?? context.colors.h598FF9,
            borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
            border: Border.all(
                color: colorBorder ?? context.colors.h598FF9, width: 2)),
        child: Text(
          text,
          style: textStyle ?? Styles.n16b.copyWith(color: colorText),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
