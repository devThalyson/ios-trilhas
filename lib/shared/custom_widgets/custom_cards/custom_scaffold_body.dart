import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomScaffoldBody extends StatelessWidget {
  final List<Widget> children;
  final double? leftMargin;
  final double? rightMargin;
  final double? topMargin;
  final double? bottomMargin;
  final bool dynamicHeight;
  final Color? color;

  CustomScaffoldBody({
    required this.children,
    this.leftMargin,
    this.rightMargin,
    this.bottomMargin,
    this.topMargin,
    this.dynamicHeight = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicHeight ? null : 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(29),
          topRight: Radius.circular(29),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(
          left: leftMargin != null ? leftMargin! : 14.3.w,
          right: rightMargin != null ? rightMargin! : 14.3.w,
          top: topMargin != null ? topMargin! : 3.8.h,
          bottom: bottomMargin != null ? bottomMargin! : 2.3.h,
        ),
        child: dynamicHeight
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                ),
              ),
      ),
    );
  }
}
