import 'package:app_trilhas/app/controllers/user_controllers/sign_up_controllers/sign_up_controller.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SignUpSucessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.43.h),
            child: CustomText(
              texto:
                  'Enviamos uma confirmação por e-mail. Confirme para a validação do seu registro.',
              tamanhoFonte: 12.sp,
              cor: AppColors.lightGrey,
              textAlign: TextAlign.center,
            ),
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
              function: () async {
                await Provider.of<SignUpController>(context, listen: false)
                    .openEmailApp();
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
                  texto: 'Não recebeu o e-mail? Olhe sua caixa de Spam!',
                  cor: AppColors.lightBrown,
                  textAlign: TextAlign.center,
                  tamanhoFonte: 12.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
