import 'dart:io';

import 'package:app_trilhas/app/controllers/user_controllers/login_controllers/login_controller.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_alerts/custom_default_alert.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_decoration_properties/custom_box_shadow.dart';

import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text_error.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text_form.dart';
import 'package:app_trilhas/shared/navigation/push_to_page/push.dart';

import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _controllerView = LoginController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          margin: EdgeInsets.only(
            left: 14.3.w,
            right: 14.3.w,
            top: 3.h,
            bottom: 2.3.h,
          ),
          child: Column(
            children: [
              CustomText(
                texto: 'SEJA BEM-VINDO',
                tamanhoFonte: 17.sp,
                cor: AppColors.thirdColor,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomText(
                texto:
                    'Acesse sua conta para conferir as melhores opções de ecoturismo de Itapema!',
                tamanhoFonte: 10.7.sp,
                cor: AppColors.lightGrey,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 3.h,
              ),
              Observer(
                builder: (_) {
                  return Container(
                    child: CustomTextForm(
                      nomeCampo: 'E-mail',
                      controller: _controllerView.emailTextForm,
                      textColor: _controllerView.emailValidateMensage.isEmpty
                          ? AppColors.lightGrey
                          : Theme.of(context).errorColor,
                      activeTextColor:
                          _controllerView.emailValidateMensage.isEmpty
                              ? AppColors.darkBrown
                              : Theme.of(context).errorColor,
                      borderColor: _controllerView.emailValidateMensage.isEmpty
                          ? AppColors.lightGrey
                          : Theme.of(context).errorColor,
                      activeBorderColor:
                          _controllerView.emailValidateMensage.isEmpty
                              ? AppColors.lightBrown
                              : Theme.of(context).errorColor,
                      labelTextColor:
                          _controllerView.emailValidateMensage.isEmpty
                              ? AppColors.lightGrey
                              : Theme.of(context).errorColor,
                      activeLabelTextColor:
                          _controllerView.emailValidateMensage.isEmpty
                              ? AppColors.lightBrown
                              : Theme.of(context).errorColor,
                      fillColor: Colors.white,
                      acaoTeclado: TextInputAction.next,
                      tipoTeclado: TextInputType.emailAddress,
                      suficone: _controllerView.emailValidateMensage.isEmpty
                          ? null
                          : Icon(
                              Icons.error_outline,
                              color: Theme.of(context).errorColor,
                            ),
                    ),
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return Visibility(
                    visible: _controllerView.emailValidateMensage.isNotEmpty,
                    child: CustomTextError(
                        mensage: _controllerView.emailValidateMensage),
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return Visibility(
                    visible: _controllerView.emailValidateMensage.isEmpty,
                    child: SizedBox(
                      height: 1.2.h,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 0.8.h,
              ),
              Observer(
                builder: (_) {
                  return CustomTextForm(
                    nomeCampo: 'Senha',
                    controller: _controllerView.passwordTextForm,
                    textColor: _controllerView.passwordValidateMensage.isEmpty
                        ? AppColors.lightGrey
                        : Theme.of(context).errorColor,
                    activeTextColor:
                        _controllerView.passwordValidateMensage.isEmpty
                            ? AppColors.darkBrown
                            : Theme.of(context).errorColor,
                    borderColor: _controllerView.passwordValidateMensage.isEmpty
                        ? AppColors.lightGrey
                        : Theme.of(context).errorColor,
                    activeBorderColor:
                        _controllerView.passwordValidateMensage.isEmpty
                            ? AppColors.lightBrown
                            : Theme.of(context).errorColor,
                    labelTextColor:
                        _controllerView.passwordValidateMensage.isEmpty
                            ? AppColors.lightGrey
                            : Theme.of(context).errorColor,
                    activeLabelTextColor:
                        _controllerView.passwordValidateMensage.isEmpty
                            ? AppColors.lightBrown
                            : Theme.of(context).errorColor,
                    fillColor: Colors.white,
                    acaoTeclado: TextInputAction.done,
                    tipoTeclado: TextInputType.text,
                    esconderTexto: true,
                    suficone: _controllerView.passwordValidateMensage.isEmpty
                        ? null
                        : Icon(
                            Icons.error_outline,
                            color: Theme.of(context).errorColor,
                          ),
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return Visibility(
                    visible: _controllerView.passwordValidateMensage.isNotEmpty,
                    child: CustomTextError(
                        mensage: _controllerView.passwordValidateMensage),
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return Visibility(
                    visible: _controllerView.passwordValidateMensage.isEmpty,
                    child: SizedBox(
                      height: 1.5.h,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Observer(
                builder: (_) {
                  return CustomButton(
                    width: double.infinity,
                    height: 6.5.h,
                    title: 'Continuar',
                    progress: _controllerView.loginProgress,
                    function: () {
                      _loginWithEmail();
                    },
                  );
                },
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomText(
                texto: 'Ou acesse com',
                tamanhoFonte: 11.sp,
                cor: AppColors.lightGrey,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: _loginWithFacebook,
                    child: Container(
                      height: 12.w,
                      width: 12.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [CustomBoxShadow()],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/facebook.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  InkWell(
                    onTap: _loginWithGoogle,
                    child: Container(
                      height: 12.w,
                      width: 12.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [CustomBoxShadow()],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/google.png',
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: Platform.isIOS,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8.w,
                        ),
                        InkWell(
                          onTap: () => _loginWithApple(),
                          child: Container(
                            height: 12.w,
                            width: 12.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [CustomBoxShadow()],
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/apple.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Observer(
          builder: (_) => Positioned(
            top: _controllerView.emailValidateMensage.isEmpty
                ? (26.h - 9.sp)
                : (28.h - 9.sp),
            right: 1.w,
            child: IconButton(
              color: AppColors.lightGrey,
              icon: Icon(Icons.info, size: 18.sp),
              onPressed: () {
                Alert(
                  title: 'Esqueceu sua senha?',
                  body:
                      'Caso tenha esquecido sua senha podemos redefinir. Deseja continuar?',
                  okOrNot: true,
                  function: () {
                    push(context: context, route: '/passwordRecoveryView');
                  },
                ).showDialog(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  _loginWithEmail() async {
    var response = await _controllerView.emailLogin(context);

    if (response == true) {
      push(context: context, route: '/homeView', replace: true);
    } else if (response == false) {
      Alert(
        title: 'Erro',
        body: _controllerView.loginMensage,
      ).showDialog(context);
    }
  }

  _loginWithFacebook() async {
    var response = await _controllerView.facebookLogin(context);
    if (response == true) {
      push(context: context, route: '/homeView', replace: true);
    } else if (response == false) {
      Alert(
        title: 'Erro',
        body: _controllerView.loginMensage,
      ).showDialog(context);
    }
  }

  _loginWithGoogle() async {
    var response = await _controllerView.googleLogin(context);

    if (response == true) {
      push(context: context, route: '/homeView', replace: true);
    } else if (response == false) {
      Alert(title: 'Erro', body: 'E-mail inválido').showDialog(context);
    }
  }

  _loginWithApple() async {
    var response = await _controllerView.appLogin(context);

    if (response == true) {
      push(context: context, route: '/homeView', replace: true);
    } else if (response == false) {
      Alert(title: 'Erro', body: 'E-mail inválido').showDialog(context);
    }
  }
}
