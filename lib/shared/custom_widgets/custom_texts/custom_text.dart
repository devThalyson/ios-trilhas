import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class CustomText extends StatelessWidget {
  final String texto;
  final int? maxLines;
  final bool? overFlow;
  final Color? cor;
  final double? tamanhoFonte;
  final bool bold;
  final bool underline;
  final String? tipoFonte;
  final TextAlign? textAlign;

  CustomText({
    required this.texto,
    this.maxLines,
    this.overFlow = false,
    this.cor,
    this.tamanhoFonte,
    this.bold = false,
    this.underline = false,
    this.tipoFonte,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overFlow == true ? TextOverflow.ellipsis : TextOverflow.visible,
      style: TextStyle(
        color: cor != null ? cor : AppColors.fontColor,
        fontFamily: tipoFonte != null ? tipoFonte : "ubuntu-medium",
        fontSize: tamanhoFonte != null ? tamanhoFonte : 13.sp,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
