import 'package:app_trilhas/shared/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomExternalPageAlert {
  final Function function;

  CustomExternalPageAlert({required this.function});

  showDialog(BuildContext context) {
    _onClickDialog(context, function);
  }
}

_onClickDialog(BuildContext context, Function function) {
  return showDialog(
    barrierColor: AppColors.darkBrown.withOpacity(0.8),
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: Container(
          height: 50.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/027-lightbulb.png',
                height: 18.h,
                width: 18.h,
              ),
              SizedBox(
                height: 2.45.h,
              ),
              CustomText(
                texto: 'Atenção',
                bold: true,
                tamanhoFonte: 15.sp,
                cor: AppColors.darkBrown,
              ),
              SizedBox(
                height: 2.22.h,
              ),
              CustomText(
                texto:
                    'Você será redirecionado para uma página externa! Deseja continuar?',
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


// _onClickDialog(
//   BuildContext context,
//   Function function,
// ) {
//   return showDialog(
//     barrierColor: AppColors.darkBrown.withOpacity(0.8),
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//         content: Container(
//           height: 50.h,
//           child: Column(
//             children: [
//               Image.asset(
//                 'assets/images/027-lightbulb.png',
//                 height: 18.h,
//                 width: 18.h,
//               ),
//               SizedBox(
//                 height: 2.45.h,
//               ),
//               CustomText(
//                 texto: 'Atenção',
//                 bold: true,
//                 tamanhoFonte: 18.sp,
//                 cor: AppColors.darkBrown,
//               ),
//               SizedBox(
//                 height: 0.98.h,
//               ),
//               CustomText(
//                 texto:
//                     'Você será redirecionado para uma página externa! Deseja continuar?',
//                 textAlign: TextAlign.center,
//                 tamanhoFonte: 11.sp,
//                 cor: AppColors.darkBrown,
//               ),
//               SizedBox(
//                 height: 2.94.h,
//               ),
//               CustomButton(
//                 width: double.infinity,
//                 title: 'Continuar',
//                 function: () {
//                   function();
//                   Navigator.pop(context);
//                 },
//               ),
//               SizedBox(
//                 height: 2.98.h,
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: CustomText(
//                   texto: 'Cancelar',
//                   underline: true,
//                   tamanhoFonte: 11.sp,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
