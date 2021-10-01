import 'package:app_trilhas/app/controllers/profile_controllers/contact_controllers/contact_controller.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_alerts/custom_default_alert.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_bars/custom_app_bar.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_cards/custom_scaffold_body.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text_form.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

class ContactView extends StatelessWidget {
  final _controllerView = ContactController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyBoardVisibile) {
        return Scaffold(
          body: _body(context, isKeyBoardVisibile),
        );
      },
    );
  }

  _body(BuildContext context, bool isKeyBoardVisible) {
    return Container(
      margin: EdgeInsets.only(
        top: 2.96.h,
      ),
      child: SafeArea(
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
              child: CustomAppBar(title: 'Contato'),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: 6.93.w,
                right: 6.93.w,
                top: 2.h,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CustomText(
                      texto: 'Fale Conosco',
                      textAlign: TextAlign.left,
                      cor: Colors.black,
                      tamanhoFonte: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomText(
                    texto: '''Duvidas, sugestões ou reclamações?
Entre em contato e retornaremos pelo e-mail informado!''',
                    textAlign: TextAlign.left,
                    cor: AppColors.grey,
                  ),
                  SizedBox(height: 26),
                  CustomTextForm(
                    nomeCampo: 'Mensagem',
                    textColor: AppColors.lightGrey,
                    activeTextColor: AppColors.darkBrown,
                    borderColor: AppColors.lightGrey,
                    activeBorderColor: AppColors.lightBrown,
                    labelTextColor: AppColors.lightGrey,
                    activeLabelTextColor: AppColors.lightBrown,
                    fillColor: Colors.white,
                    acaoTeclado: TextInputAction.done,
                    tipoTeclado: TextInputType.multiline,
                    controller: _controllerView.contactTextForm,
                    maxLines: 8,
                  ),
                  Observer(
                    builder: (_) {
                      return Visibility(
                        visible:
                            _controllerView.sendEmailValidateMensage.isNotEmpty,
                        child: Container(
                          width: 90.w,
                          height: 3.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Colors.red.withOpacity(
                              0.3,
                            ),
                          ),
                          child: CustomText(
                            texto: _controllerView.sendEmailValidateMensage,
                            cor: Colors.red,
                            tamanhoFonte: 10.sp,
                          ),
                        ),
                      );
                    },
                  ),
                  isKeyBoardVisible
                      ? SizedBox(
                          height: 3.31.h,
                        )
                      : SizedBox(height: 20.h),
                  Observer(
                    builder: (_) {
                      return CustomButton(
                        progress: _controllerView.sendEmailProgress,
                        width: 70.w,
                        title: 'Continuar',
                        function: () {
                          _sendEmail(context);
                        },
                      );
                    },
                  ),
                  SizedBox(height: 2.21.h),
                  Visibility(
                    child: CustomText(
                      texto:
                          'Tocando em "Continuar" você será redirecionado para seu aplicativo de e-mail com sua mensagem pronta, bastará tocar no botão "enviar" lá mesmo.',
                      tamanhoFonte: 10.sp,
                      cor: AppColors.lightGrey,
                      textAlign: TextAlign.center,
                    ),
                    visible: !isKeyBoardVisible,
                  ),
                  SizedBox(height: 1.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sendEmail(BuildContext context) async {
    var response = await _controllerView.sendEmail();

    if (response == false) {
      Alert(
              title: 'Erro',
              body:
                  'Verifique se seu dispotivo tem algum aplicativo de e-mail instalado')
          .showDialog(context);
    }
  }
}
