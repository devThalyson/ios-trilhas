import 'package:app_trilhas/app/controllers/user_controllers/password_recovery_controllers/password_recovery_controller.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_alerts/custom_default_alert.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_bars/custom_app_bar.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_cards/custom_scaffold_body.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text_error.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text_form.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

class PasswordRecoveryView extends StatelessWidget {
  final _controllerView = PasswordRecoveryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SafeArea(
      child: PageView(
        controller: _controllerView.pageController,
        onPageChanged: _controllerView.changePageIndex,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _passwordResetView(context),
          _sucessPasswordResetView(context),
        ],
      ),
    );
  }

  _passwordResetView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 2.96.h,
      ),
      child: Column(
        children: [
          Flexible(
            child: CustomScaffoldBody(
              topMargin: 0,
              bottomMargin: 0,
              leftMargin: 0,
              rightMargin: 0,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 3.8.h,
                  ),
                  child: CustomAppBar(title: 'Redefinir senha'),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 14.3.w,
                    right: 14.3.w,
                    bottom: 2.3.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 1.97.h,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          texto:
                              'Por favor, insira um e-mail cadastrado. Encaminharemos uma mensagem para redifinição de senha.',
                          cor: AppColors.lightGrey,
                          textAlign: TextAlign.center,
                          tamanhoFonte: 12.sp,
                        ),
                      ),
                      SizedBox(
                        height: 4.19.h,
                      ),
                      Observer(
                        builder: (_) {
                          return CustomTextForm(
                            nomeCampo: 'E-mail',
                            controller: _controllerView.emailTextForm,
                            tipoTeclado: TextInputType.emailAddress,
                            acaoTeclado: TextInputAction.done,
                            textColor: _controllerView
                                    .passwordRecoveryValidateMensage.isEmpty
                                ? AppColors.lightGrey
                                : Theme.of(context).errorColor,
                            activeTextColor: _controllerView
                                    .passwordRecoveryValidateMensage.isEmpty
                                ? AppColors.darkBrown
                                : Theme.of(context).errorColor,
                            borderColor: _controllerView
                                    .passwordRecoveryValidateMensage.isEmpty
                                ? AppColors.lightGrey
                                : Theme.of(context).errorColor,
                            activeBorderColor: _controllerView
                                    .passwordRecoveryValidateMensage.isEmpty
                                ? AppColors.lightBrown
                                : Theme.of(context).errorColor,
                            labelTextColor: _controllerView
                                    .passwordRecoveryValidateMensage.isEmpty
                                ? AppColors.lightGrey
                                : Theme.of(context).errorColor,
                            activeLabelTextColor: _controllerView
                                    .passwordRecoveryValidateMensage.isEmpty
                                ? AppColors.lightBrown
                                : Theme.of(context).errorColor,
                            fillColor: Colors.white,
                            suficone: _controllerView
                                    .passwordRecoveryValidateMensage.isEmpty
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
                            visible: _controllerView
                                .passwordRecoveryValidateMensage.isNotEmpty,
                            child: CustomTextError(
                                mensage: _controllerView
                                    .passwordRecoveryValidateMensage),
                          );
                        },
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Observer(
                        builder: (_) {
                          return CustomButton(
                            width: double.infinity,
                            progress: _controllerView.passwordRecoveryProgress,
                            title: 'Continuar',
                            function: () {
                              _passwordRecovery(context);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _sucessPasswordResetView(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.circular(18),
            ),
            height: 15.15.h,
            width: 15.27.h,
            child: Icon(
              Icons.mark_email_unread,
              color: Theme.of(context).primaryColor,
              size: 9.61.h,
            ),
          ),
          SizedBox(
            height: 5.67.h,
          ),
          CustomText(
            texto: 'Veja seu e-mail',
            cor: AppColors.darkBrown,
            bold: true,
            tamanhoFonte: 24.sp,
          ),
          SizedBox(
            height: 1.72.h,
          ),
          CustomText(
            texto:
                'Enviamos uma confirmação por e-mail para a redefinição de sua senha atual.',
            tamanhoFonte: 12.sp,
            cor: AppColors.lightGrey,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 6.65.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 6.28.h,
            ),
            child: CustomButton(
              width: double.infinity,
              title: 'Abrir app de e-mail',
              function: () {
                _controllerView.openEmailApp();
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            height: 2.46.h,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CustomText(
              texto: 'Sair e confirmar depois',
              cor: AppColors.darkBrown,
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(
              left: 3.45.h,
              right: 3.45.h,
              bottom: 3.94.h,
            ),
            child: Column(
              children: [
                CustomText(
                  texto: 'Não recebeu o e-mail? Olhe sua caixa de Spam',
                  cor: AppColors.lightBrown,
                  textAlign: TextAlign.center,
                  tamanhoFonte: 12.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      texto: 'ou ',
                      cor: AppColors.lightBrown,
                      textAlign: TextAlign.center,
                      tamanhoFonte: 12.sp,
                    ),
                    InkWell(
                      onTap: () {
                        _controllerView.previousPage();
                      },
                      child: CustomText(
                        texto: 'tente com outro endereço de e-mail',
                        cor: Theme.of(context).primaryColor,
                        textAlign: TextAlign.center,
                        tamanhoFonte: 12.sp,
                        bold: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _passwordRecovery(BuildContext context) async {
    var response = await _controllerView.passwordRecovery(context);

    if (response == true) {
      _controllerView.nextPage();
    } else if (response == false) {
      Alert(title: 'Erro', body: _controllerView.passwordRecoveryMensage)
          .showDialog(context);
    }
  }
}
