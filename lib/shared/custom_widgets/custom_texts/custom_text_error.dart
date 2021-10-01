import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextError extends StatelessWidget {
  final String mensage;

  CustomTextError({required this.mensage});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68.w,
      height: 3.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Colors.red.withOpacity(
          0.3,
        ),
      ),
      child: CustomText(
        texto: mensage,
        cor: Colors.red,
        tamanhoFonte: 10.7.sp,
      ),
    );
  }
}
