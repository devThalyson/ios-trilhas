import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  final double? size;

  CustomBackButton({
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: color != null ? color : Colors.white,
        size: size != null ? size : 20.sp,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
