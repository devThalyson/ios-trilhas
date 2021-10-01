import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double? height;

  final String title;
  final Function() function;
  final Color? buttonColor;
  final Color? textColor;
  final bool? progress;
  final bool isGradient;
  final List<Color>? gradientColors;
  final double? fontSize;

  CustomButton({
    required this.width,
    required this.title,
    required this.function,
    this.height,
    this.buttonColor,
    this.textColor,
    this.progress,
    this.isGradient = false,
    this.gradientColors,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 7.h,
      width: width,
      decoration: BoxDecoration(
          color: buttonColor != null
              ? buttonColor
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
          gradient: isGradient
              ? LinearGradient(
                  colors: gradientColors!,
                )
              : null),
      child: progress == true
          ? Center(
              child: Container(
                height: 3.h,
                width: 3.h,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            )
          : TextButton(
              onPressed: function,
              child: CustomText(
                texto: title,
                cor: textColor != null ? textColor : AppColors.darkBrown,
                tamanhoFonte: fontSize != null ? fontSize : 13.3.sp,
              ),
            ),
    );
  }
}
