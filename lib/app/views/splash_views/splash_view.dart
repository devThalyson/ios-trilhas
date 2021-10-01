import 'dart:io';

import 'package:app_trilhas/shared/navigation/push_to_page/push.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:app_trilhas/shared/utils/firebase_references.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    if (Platform.isIOS) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersiveSticky,
      );
    } else {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersive,
      );
    }

    var user = Provider.of<FirebaseReferences>(context, listen: false)
        .getCurrentUser();

    if (user == null) {
      Future.delayed(Duration(seconds: 4)).then((_) {
        push(context: context, route: '/userHomeView', replace: true);
      });
    } else {
      Future.delayed(Duration(seconds: 4)).then((_) {
        push(context: context, route: '/homeView', replace: true);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();

    if (Platform.isAndroid) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
    }

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: HSLColor.fromColor(AppColors.primaryColor)
            .withLightness(0.4)
            .toColor(),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  _body() {
    return Container(
      width: 100.w,
      height: 100.h,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/background_splash_image.png',
            width: 100.w,
            fit: BoxFit.cover,
          ),
          Container(
            width: 100.w,
            height: 100.h,
            color: Colors.black.withOpacity(0.1),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 10.h,
            ),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/Logo Amarela.png',
              height: 85.w,
              width: 85.w,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 65.h,
              left: 10.w,
              right: 10.w,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/aAtivo 2.png',
                ),
                Image.asset(
                  'assets/images/Itapema Logo.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
