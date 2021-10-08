import 'dart:io';

import 'package:app_trilhas/app/controllers/user_controllers/user_home_view_controllers/user_home_view.controller.dart';
import 'package:app_trilhas/app/views/user_views/login_view/login_view.dart';
import 'package:app_trilhas/app/views/user_views/sign_up_view/sign_up_view.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_bars/custom_logo_bar.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_cards/custom_scaffold_body.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_decoration_properties/custom_box_shadow.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

class UserHomeView extends StatefulWidget {
  @override
  _UserHomeViewState createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView>
    with TickerProviderStateMixin {
  AnimationController? _animationController1;
  Animation<double>? _animation1;

  AnimationController? _animationController2;
  Animation<double>? _animation2;

  final _controllerView = UserHomeViewController();

  @override
  void initState() {
    _animationController1 = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
      reverseDuration: Duration(milliseconds: 700),
    )..forward();
    _animation1 =
        CurvedAnimation(parent: _animationController1!, curve: Curves.easeIn);

    _animationController2 = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
      reverseDuration: Duration(milliseconds: 1000),
    );

    _animation2 =
        CurvedAnimation(parent: _animationController2!, curve: Curves.easeIn);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    if (_animationController1 != null) {
      _animationController1!.dispose();
    }

    if (_animationController2 != null) {
      _animationController2!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: Stack(
        children: [
          Observer(
            builder: (_) {
              return CustomLogoBar(
                resize: _controllerView.logoBarResize,
              );
            },
          ),
          Observer(
            builder: (_) {
              return AnimatedContainer(
                curve: Curves.easeOutSine,
                duration: Duration(
                  milliseconds: 700,
                ),
                margin: EdgeInsets.only(
                  top: _controllerView.logoBarResize
                      ? Platform.isIOS
                          ? 13.h
                          : 14.h
                      : Platform.isIOS
                          ? 25.h
                          : 30.h,
                ),
                child: CustomScaffoldBody(
                  bottomMargin: 0,
                  leftMargin: 0,
                  rightMargin: 0,
                  topMargin: 0,
                  children: [
                    FadeTransition(
                        opacity: _controllerView.segmentIndex == 0
                            ? _animation1!
                            : _animation2!,
                        child: _controllerView.segmentIndex == 0
                            ? LoginView()
                            : SignUpView()),
                  ],
                ),
              );
            },
          ),
          Positioned(
            child: _segment(context),
            top: Platform.isIOS ? 89.h : 92.h,
            left: 14.5.w,
            right: 14.5.w,
          ),
        ],
      ),
    );
  }

  _segment(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: AppColors.accentColor,

            // Box Shadow here
            boxShadow: [
              CustomBoxShadow(opacity: 0.16),
            ],
            // Box Shadow here
          ),
          width: 75.w,
          height: MediaQuery.of(context).size.height / 14.0,
          child: CupertinoSlidingSegmentedControl<int>(
            padding: EdgeInsets.zero,
            thumbColor: Theme.of(context).primaryColor,
            children: {
              0: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 14.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: CustomText(
                  texto: 'Login',
                  tamanhoFonte: 13.3.sp,
                  cor: _controllerView.segmentIndex == 0
                      ? Colors.white
                      : AppColors.thirdColor,
                  bold: _controllerView.segmentIndex == 0,
                ),
              ),
              1: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 14.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: CustomText(
                  texto: 'Cadastro',
                  tamanhoFonte: 13.3.sp,
                  cor: _controllerView.segmentIndex == 0
                      ? AppColors.thirdColor
                      : Colors.white,
                  bold: _controllerView.segmentIndex == 1,
                ),
              ),
            },
            onValueChanged: (index) {
              _controllerView.changeSegmentIndex(
                index!,
                _animationController1!,
                _animationController2!,
              );
            },
            groupValue: _controllerView.segmentIndex,
            backgroundColor: AppColors.accentColor,
          ),
        );
      },
    );
  }
}
