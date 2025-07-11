import 'package:flutter/material.dart';
import 'package:woow_social/core/constants/color_constants.dart';
import 'package:woow_social/core/utils/font_style_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final EdgeInsets margin;
  final bool allowGradient;
  final Color color;
  final double height;
  final double borderRadius;
  final Color? textColor;
  final TextStyle? textStyle;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.allowGradient = false,
    this.color = ColorConstants.primaryColor,
    this.height = 50,
    this.borderRadius = 25,
    this.textColor,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: InkWell(
        onTap: () => onPressed(),
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: double.infinity,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: allowGradient ? null : color,
            gradient: allowGradient
                ? const LinearGradient(
                    colors: [
                      ColorConstants.primaryColor100,
                      ColorConstants.primaryColor200,
                      ColorConstants.primaryColor300,
                      ColorConstants.primaryColor400,
                      ColorConstants.primaryColor,
                    ],
                  )
                : null,
          ),
          child: Text(
            text,
            style: textStyle ??
                FontStyles.fontBold(
                  color: textColor ?? Colors.white,
                  fontSize: 16,
                ),
          ),
        ),
      ),
    );
  }
}
