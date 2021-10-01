import 'package:app_trilhas/shared/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Alert {
  final bool okOrNot;
  final String title;
  final String body;
  final Function? function;
  final bool? push;
  final Function? pushFunction;
  final double opacity;

  Alert({
    this.okOrNot = false,
    required this.title,
    required this.body,
    this.function,
    this.push = false,
    this.pushFunction,
    this.opacity = 0.8,
  });

  showDialog(BuildContext context) {
    okOrNot
        ? _onClickDialogOkorNot(context, title, body, function!,
            pushable: push, pushFunction: pushFunction, opacity: opacity)
        : _onClickDialog(context, title, body,
            pushable: push, pushFunction: pushFunction, opacity: opacity);
  }
}

_onClickDialog(BuildContext context, String title, String body,
    {bool? pushable, Function? pushFunction, required double opacity}) {
  return showDialog(
    barrierColor: AppColors.darkBrown.withOpacity(opacity),
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: Container(
          height: 25.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                texto: title,
                bold: true,
                tamanhoFonte: 15.sp,
                cor: AppColors.darkBrown,
              ),
              SizedBox(
                height: 2.22.h,
              ),
              CustomText(
                texto: body,
                textAlign: TextAlign.center,
                tamanhoFonte: 11.sp,
                cor: AppColors.lightGrey,
              ),
              SizedBox(
                height: 4.19.h,
              ),
              CustomButton(
                width: double.infinity,
                title: 'Continuar',
                function: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

_onClickDialogOkorNot(
    BuildContext context, String title, String body, Function function,
    {bool? pushable, Function? pushFunction, required double opacity}) {
  return showDialog(
    barrierColor: AppColors.darkBrown.withOpacity(opacity),
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: Container(
          height: 30.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                texto: title,
                bold: true,
                tamanhoFonte: 15.sp,
                cor: AppColors.darkBrown,
              ),
              SizedBox(
                height: 2.22.h,
              ),
              CustomText(
                texto: body,
                textAlign: TextAlign.center,
                tamanhoFonte: 11.sp,
                cor: AppColors.lightGrey,
              ),
              SizedBox(
                height: 4.19.h,
              ),
              CustomButton(
                width: double.infinity,
                title: 'Continuar',
                function: () {
                  Navigator.pop(context);
                  function();
                },
              ),
              SizedBox(
                height: 2.22.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomText(
                  texto: 'Cancelar',
                  cor: AppColors.darkBrown,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
