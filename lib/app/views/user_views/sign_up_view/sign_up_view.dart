import 'package:app_trilhas/app/controllers/user_controllers/sign_up_controllers/sign_up_controller.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_alerts/custom_default_alert.dart';

import 'package:app_trilhas/shared/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text_error.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text_form.dart';
import 'package:app_trilhas/shared/navigation/push_to_page/push.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:app_trilhas/shared/validations/masks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var _controllerView = SignUpController();

  @override
  void initState() {
    _controllerView = Provider.of<SignUpController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _signUpForm();
  }

  _signUpForm() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(
        left: 9.w,
        right: 9.w,
        top: 1.h,
        bottom: 2.3.h,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          CustomText(
            texto: 'SUA PRIMEIRA VEZ AQUI?',
            tamanhoFonte: 17.sp,
            cor: AppColors.thirdColor,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomText(
            texto:
                'Preencha os campos para conhecer algumas das melhores opções entre parques, trilhas e muito mais em Itapema!',
            tamanhoFonte: 10.7.sp,
            cor: AppColors.lightGrey,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 2.h,
          ),
          Observer(
            builder: (_) {
              return CustomTextForm(
                nomeCampo: 'Nome',
                controller: _controllerView.nameTextForm,
                textColor: _controllerView.nameValidateMensage.isEmpty
                    ? AppColors.lightGrey
                    : Theme.of(context).errorColor,
                activeTextColor: _controllerView.nameValidateMensage.isEmpty
                    ? AppColors.darkBrown
                    : Theme.of(context).errorColor,
                borderColor: _controllerView.nameValidateMensage.isEmpty
                    ? AppColors.lightGrey
                    : Theme.of(context).errorColor,
                activeBorderColor: _controllerView.nameValidateMensage.isEmpty
                    ? AppColors.lightBrown
                    : Theme.of(context).errorColor,
                labelTextColor: _controllerView.nameValidateMensage.isEmpty
                    ? AppColors.lightGrey
                    : Theme.of(context).errorColor,
                activeLabelTextColor:
                    _controllerView.nameValidateMensage.isEmpty
                        ? AppColors.lightBrown
                        : Theme.of(context).errorColor,
                fillColor: Colors.white,
                acaoTeclado: TextInputAction.next,
                tipoTeclado: TextInputType.text,
                suficone: _controllerView.nameValidateMensage.isNotEmpty
                    ? Icon(
                        Icons.error_outline,
                        color: Theme.of(context).errorColor,
                      )
                    : null,
              );
            },
          ),
          Observer(
            builder: (_) {
              return Visibility(
                visible: _controllerView.nameValidateMensage.isNotEmpty,
                child: CustomTextError(
                    mensage: _controllerView.nameValidateMensage),
              );
            },
          ),
          Observer(
            builder: (_) {
              return Visibility(
                visible: _controllerView.nameValidateMensage.isEmpty,
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
                  nomeCampo: 'Data de nascimento',
                  controller: _controllerView.birthDateTextForm,
                  textColor: _controllerView.birthDateValidateMensage.isEmpty
                      ? AppColors.lightGrey
                      : Theme.of(context).errorColor,
                  activeTextColor:
                      _controllerView.birthDateValidateMensage.isEmpty
                          ? AppColors.darkBrown
                          : Theme.of(context).errorColor,
                  borderColor: _controllerView.birthDateValidateMensage.isEmpty
                      ? AppColors.lightGrey
                      : Theme.of(context).errorColor,
                  activeBorderColor:
                      _controllerView.birthDateValidateMensage.isEmpty
                          ? AppColors.lightBrown
                          : Theme.of(context).errorColor,
                  labelTextColor:
                      _controllerView.birthDateValidateMensage.isEmpty
                          ? AppColors.lightGrey
                          : Theme.of(context).errorColor,
                  activeLabelTextColor:
                      _controllerView.birthDateValidateMensage.isEmpty
                          ? AppColors.lightBrown
                          : Theme.of(context).errorColor,
                  fillColor: Colors.white,
                  tipoTeclado: TextInputType.datetime,
                  mask: Masks.birthDateMask,
                  acaoTeclado: TextInputAction.next,
                  suficone: _controllerView.birthDateValidateMensage.isEmpty
                      ? null
                      : Icon(
                          Icons.error_outline,
                          color: Theme.of(context).errorColor,
                        ));
            },
          ),
          Observer(
            builder: (_) {
              return Visibility(
                visible: _controllerView.birthDateValidateMensage.isNotEmpty,
                child: CustomTextError(
                    mensage: _controllerView.birthDateValidateMensage),
              );
            },
          ),
          Observer(
            builder: (_) {
              return Visibility(
                visible: _controllerView.birthDateValidateMensage.isEmpty,
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
                nomeCampo: 'E-mail',
                controller: _controllerView.emailTextForm,
                textColor: _controllerView.emailValidateMensage.isEmpty
                    ? AppColors.lightGrey
                    : Theme.of(context).errorColor,
                activeTextColor: _controllerView.emailValidateMensage.isEmpty
                    ? AppColors.darkBrown
                    : Theme.of(context).errorColor,
                borderColor: _controllerView.emailValidateMensage.isEmpty
                    ? AppColors.lightGrey
                    : Theme.of(context).errorColor,
                activeBorderColor: _controllerView.emailValidateMensage.isEmpty
                    ? AppColors.lightBrown
                    : Theme.of(context).errorColor,
                labelTextColor: _controllerView.emailValidateMensage.isEmpty
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
                activeTextColor: _controllerView.passwordValidateMensage.isEmpty
                    ? AppColors.darkBrown
                    : Theme.of(context).errorColor,
                borderColor: _controllerView.passwordValidateMensage.isEmpty
                    ? AppColors.lightGrey
                    : Theme.of(context).errorColor,
                activeBorderColor:
                    _controllerView.passwordValidateMensage.isEmpty
                        ? AppColors.lightBrown
                        : Theme.of(context).errorColor,
                labelTextColor: _controllerView.passwordValidateMensage.isEmpty
                    ? AppColors.lightGrey
                    : Theme.of(context).errorColor,
                activeLabelTextColor:
                    _controllerView.passwordValidateMensage.isEmpty
                        ? AppColors.lightBrown
                        : Theme.of(context).errorColor,
                fillColor: Colors.white,
                acaoTeclado: TextInputAction.next,
                esconderTexto: true,
                tipoTeclado: TextInputType.text,
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
                nomeCampo: 'Confirmar senha',
                controller: _controllerView.repeatedPasswordTextForm,
                textColor:
                    _controllerView.repeatedPasswordValidateMensage.isEmpty
                        ? AppColors.lightGrey
                        : Theme.of(context).errorColor,
                activeTextColor:
                    _controllerView.repeatedPasswordValidateMensage.isEmpty
                        ? AppColors.darkBrown
                        : Theme.of(context).errorColor,
                borderColor:
                    _controllerView.repeatedPasswordValidateMensage.isEmpty
                        ? AppColors.lightGrey
                        : Theme.of(context).errorColor,
                activeBorderColor:
                    _controllerView.repeatedPasswordValidateMensage.isEmpty
                        ? AppColors.lightBrown
                        : Theme.of(context).errorColor,
                labelTextColor:
                    _controllerView.repeatedPasswordValidateMensage.isEmpty
                        ? AppColors.lightGrey
                        : Theme.of(context).errorColor,
                activeLabelTextColor:
                    _controllerView.repeatedPasswordValidateMensage.isEmpty
                        ? AppColors.lightBrown
                        : Theme.of(context).errorColor,
                fillColor: Colors.white,
                acaoTeclado: TextInputAction.done,
                tipoTeclado: TextInputType.text,
                esconderTexto: true,
                suficone:
                    _controllerView.repeatedPasswordValidateMensage.isEmpty
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
                visible:
                    _controllerView.repeatedPasswordValidateMensage.isNotEmpty,
                child: CustomTextError(
                    mensage: _controllerView.repeatedPasswordValidateMensage),
              );
            },
          ),
          Observer(
            builder: (_) {
              return Visibility(
                visible:
                    _controllerView.repeatedPasswordValidateMensage.isEmpty,
                child: SizedBox(
                  height: 2.0.h,
                ),
              );
            },
          ),
          SizedBox(
            height: 1.0.h,
          ),
          Observer(
            builder: (_) {
              return CustomButton(
                width: double.infinity,
                height: 6.5.h,
                title: 'Continuar',
                progress: _controllerView.signUpProgress,
                function: () {
                  _signUp();
                },
              );
            },
          ),
        ],
      ),
    );
  }

  _signUp() async {
    var response = await _controllerView.signUp(context);

    if (response == true) {
      push(context: context, route: '/signUpSucessView');
    } else if (response == false) {
      Alert(
        title: 'Erro',
        body: _controllerView.signUpMensage,
      ).showDialog(context);
    }
  }
}
