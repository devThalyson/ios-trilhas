import 'package:app_trilhas/app/controllers/profile_controllers/update_data_controllers/update_data_controller.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_alerts/custom_default_alert.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_animations/custom_progress_indicator.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_bars/custom_app_bar.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_cards/custom_scaffold_body.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text_error.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text_form.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:app_trilhas/shared/validations/masks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

class UpdateDataView extends StatelessWidget {
  final _controllerView = UpdateDataController();

  @override
  Widget build(BuildContext context) {
    _controllerView.loadUserData(context);

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          body: _body(context, isKeyboardVisible),
        );
      },
    );
  }

  _body(BuildContext context, bool isKeyboardVisible) {
    return Container(
      margin: EdgeInsets.only(
        top: 7.h,
      ),
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
            child: CustomAppBar(title: 'Atualizar dados'),
          ),
          Observer(
            builder: (_) {
              return _controllerView.loadUserDateProgress
                  ? Container(
                      margin: EdgeInsets.only(
                        top: 5.h,
                      ),
                      child: CustomProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        left: 6.93.w,
                        right: 6.93.w,
                        top: 8.h,
                      ),
                      child: Column(
                        children: [
                          Observer(
                            builder: (_) {
                              return CustomTextForm(
                                nomeCampo: 'Nome',
                                controller: _controllerView.nameTextForm,
                                ativarCampo:
                                    _controllerView.user!.authMethod == null,
                                disableFieldColor: Colors.white,
                                textColor:
                                    _controllerView.nameValidateMensage.isEmpty
                                        ? AppColors.lightGrey
                                        : Theme.of(context).errorColor,
                                activeTextColor:
                                    _controllerView.nameValidateMensage.isEmpty
                                        ? AppColors.darkBrown
                                        : Theme.of(context).errorColor,
                                borderColor:
                                    _controllerView.nameValidateMensage.isEmpty
                                        ? AppColors.lightGrey
                                        : Theme.of(context).errorColor,
                                activeBorderColor:
                                    _controllerView.nameValidateMensage.isEmpty
                                        ? AppColors.lightBrown
                                        : Theme.of(context).errorColor,
                                labelTextColor:
                                    _controllerView.nameValidateMensage.isEmpty
                                        ? AppColors.lightGrey
                                        : Theme.of(context).errorColor,
                                activeLabelTextColor:
                                    _controllerView.nameValidateMensage.isEmpty
                                        ? AppColors.lightBrown
                                        : Theme.of(context).errorColor,
                                fillColor: Colors.white,
                                acaoTeclado: TextInputAction.next,
                                tipoTeclado: TextInputType.text,
                                suficone: _controllerView
                                        .nameValidateMensage.isNotEmpty
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
                                visible: _controllerView
                                    .nameValidateMensage.isNotEmpty,
                                child: CustomTextError(
                                    mensage:
                                        _controllerView.nameValidateMensage),
                              );
                            },
                          ),
                          Observer(
                            builder: (_) {
                              return Visibility(
                                visible:
                                    _controllerView.nameValidateMensage.isEmpty,
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
                              return Visibility(
                                visible:
                                    _controllerView.user!.authMethod == null,
                                child: CustomTextForm(
                                    nomeCampo: 'Data de nascimento',
                                    controller:
                                        _controllerView.birthDateTextForm,
                                    textColor: _controllerView
                                            .birthDateValidateMensage.isEmpty
                                        ? AppColors.lightGrey
                                        : Theme.of(context).errorColor,
                                    activeTextColor: _controllerView
                                            .birthDateValidateMensage.isEmpty
                                        ? AppColors.darkBrown
                                        : Theme.of(context).errorColor,
                                    borderColor: _controllerView
                                            .birthDateValidateMensage.isEmpty
                                        ? AppColors.lightGrey
                                        : Theme.of(context).errorColor,
                                    activeBorderColor: _controllerView
                                            .birthDateValidateMensage.isEmpty
                                        ? AppColors.lightBrown
                                        : Theme.of(context).errorColor,
                                    labelTextColor: _controllerView
                                            .birthDateValidateMensage.isEmpty
                                        ? AppColors.lightGrey
                                        : Theme.of(context).errorColor,
                                    activeLabelTextColor: _controllerView
                                            .birthDateValidateMensage.isEmpty
                                        ? AppColors.lightBrown
                                        : Theme.of(context).errorColor,
                                    fillColor: Colors.white,
                                    tipoTeclado: TextInputType.datetime,
                                    mask: Masks.birthDateMask,
                                    acaoTeclado: TextInputAction.next,
                                    suficone: _controllerView
                                            .birthDateValidateMensage.isEmpty
                                        ? null
                                        : Icon(
                                            Icons.error_outline,
                                            color: Theme.of(context).errorColor,
                                          )),
                              );
                            },
                          ),
                          Observer(
                            builder: (_) {
                              return Visibility(
                                visible: _controllerView
                                    .birthDateValidateMensage.isNotEmpty,
                                child: CustomTextError(
                                    mensage: _controllerView
                                        .birthDateValidateMensage),
                              );
                            },
                          ),
                          Observer(
                            builder: (_) {
                              return Visibility(
                                visible: _controllerView
                                    .birthDateValidateMensage.isEmpty,
                                child: SizedBox(
                                  height: 1.2.h,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 0.8.h),
                          Observer(
                            builder: (_) {
                              return CustomTextForm(
                                nomeCampo: 'E-mail',
                                controller: _controllerView.emailTextForm,
                                textColor:
                                    _controllerView.emailValidateMensage.isEmpty
                                        ? AppColors.lightGrey
                                        : Theme.of(context).errorColor,
                                ativarCampo:
                                    _controllerView.user!.authMethod == null,
                                disableFieldColor: Colors.white,
                                activeTextColor:
                                    _controllerView.emailValidateMensage.isEmpty
                                        ? AppColors.darkBrown
                                        : Theme.of(context).errorColor,
                                borderColor:
                                    _controllerView.emailValidateMensage.isEmpty
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
                                suficone:
                                    _controllerView.emailValidateMensage.isEmpty
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
                                    .emailValidateMensage.isNotEmpty,
                                child: CustomTextError(
                                    mensage:
                                        _controllerView.emailValidateMensage),
                              );
                            },
                          ),
                          Observer(
                            builder: (_) {
                              return Visibility(
                                visible: _controllerView
                                    .emailValidateMensage.isEmpty,
                                child: SizedBox(
                                  height: 1.2.h,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 2.h),
                          Observer(
                            builder: (_) {
                              return Visibility(
                                visible:
                                    _controllerView.user!.authMethod == null,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: 1.w,
                                  ),
                                  child: CustomText(
                                    texto:
                                        'Informe sua senha para confirmar as atualizações:',
                                    tamanhoFonte: 12.sp,
                                    cor: AppColors.darkBrown,
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 1.3.h,
                          ),
                          Observer(
                            builder: (_) {
                              return Visibility(
                                visible:
                                    _controllerView.user!.authMethod == null,
                                child: CustomTextForm(
                                  nomeCampo: 'Senha',
                                  controller: _controllerView.passwordTextForm,
                                  textColor: _controllerView
                                          .passwordValidateMensage.isEmpty
                                      ? AppColors.lightGrey
                                      : Theme.of(context).errorColor,
                                  activeTextColor: _controllerView
                                          .passwordValidateMensage.isEmpty
                                      ? AppColors.darkBrown
                                      : Theme.of(context).errorColor,
                                  borderColor: _controllerView
                                          .passwordValidateMensage.isEmpty
                                      ? AppColors.lightGrey
                                      : Theme.of(context).errorColor,
                                  activeBorderColor: _controllerView
                                          .passwordValidateMensage.isEmpty
                                      ? AppColors.lightBrown
                                      : Theme.of(context).errorColor,
                                  labelTextColor: _controllerView
                                          .passwordValidateMensage.isEmpty
                                      ? AppColors.lightGrey
                                      : Theme.of(context).errorColor,
                                  activeLabelTextColor: _controllerView
                                          .passwordValidateMensage.isEmpty
                                      ? AppColors.lightBrown
                                      : Theme.of(context).errorColor,
                                  fillColor: Colors.white,
                                  acaoTeclado: TextInputAction.done,
                                  tipoTeclado: TextInputType.text,
                                  esconderTexto: true,
                                  suficone: _controllerView
                                          .passwordValidateMensage.isEmpty
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
                                visible: _controllerView
                                    .passwordValidateMensage.isNotEmpty,
                                child: CustomTextError(
                                    mensage: _controllerView
                                        .passwordValidateMensage),
                              );
                            },
                          ),
                          Observer(
                            builder: (_) {
                              return Visibility(
                                visible: _controllerView
                                    .passwordValidateMensage.isEmpty,
                                child: SizedBox(
                                  height: 1.2.h,
                                ),
                              );
                            },
                          ),
                          isKeyboardVisible
                              ? SizedBox(
                                  height: 3.h,
                                )
                              : SizedBox(height: 23.h),
                          Observer(
                            builder: (_) {
                              return CustomButton(
                                width: double.infinity,
                                title: 'Atualizar',
                                buttonColor:
                                    _controllerView.user!.authMethod == null
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey[300],
                                progress: _controllerView.updateDataProgress,
                                function:
                                    _controllerView.user!.authMethod == null
                                        ? () {
                                            _updateData(context);
                                          }
                                        : () {},
                              );
                            },
                          ),
                          SizedBox(height: 3.92.h)
                        ],
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }

  _updateData(BuildContext context) async {
    var response = await _controllerView.updateData(context);

    if (response == true) {
      Alert(
        body: _controllerView.updateDataMensage,
        title: 'Sucesso',
      ).showDialog(context);
    } else if (response == false) {
      Alert(
        body: _controllerView.updateDataMensage,
        title: 'Erro',
      ).showDialog(context);
    }
  }
}
