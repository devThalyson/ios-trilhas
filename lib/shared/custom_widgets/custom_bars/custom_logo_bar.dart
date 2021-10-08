import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomLogoBar extends StatelessWidget {
  final bool resize;

  CustomLogoBar({
    this.resize = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/background_splash_image.png',
            width: 100.w,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              curve: Curves.easeOutSine,
              duration: Duration(
                milliseconds: 700,
              ),
              margin: !Platform.isIOS
                  ? EdgeInsets.only(
                      top: resize ? 5.5.h : 9.h,
                      bottom: resize ? 7.h : 9.h,
                    )
                  : EdgeInsets.only(
                      top: resize ? 4.5.h : 5.h,
                      bottom: resize ? 7.h : 9.h,
                    ),
              width: resize ? 40.w : 70.w,
              height: resize ? 6.5.h : 17.h,
              child: Image.asset(
                'assets/images/Logo Amarela.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
