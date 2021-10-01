import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBoxShadow extends BoxShadow {
  final double opacity;
  final Color cor;

  CustomBoxShadow({
    this.opacity = 0.08,
    this.cor = AppColors.shadowColor,
  }) : super(
          color: cor.withOpacity(opacity),
          blurRadius: 6,
          offset: Offset(0, 3), // changes position of shadow
        );
}
