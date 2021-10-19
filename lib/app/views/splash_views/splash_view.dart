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

    if (!Platform.isIOS) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [],
      );
    }
    if (!Platform.isAndroid) {
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

    if (!Platform.isAndroid) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );

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
      child: Image.asset(
        'assets/images/splash-image.png',
      ),
    );
  }
}
