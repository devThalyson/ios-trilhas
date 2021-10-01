import 'package:app_trilhas/shared/custom_widgets/custom_buttons/custom_positioned_icon_button.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool backButton;

  CustomAppBar({required this.title, this.backButton = true});

  @override
  Widget build(BuildContext context) {
    final height = 6.h;

    return Container(
      width: double.infinity,
      height: height,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: CustomText(
              texto: title,
              tamanhoFonte: 16.5.sp,
              bold: true,
              overFlow: true,
              maxLines: 1,
              cor: AppColors.darkBrown,
              textAlign: TextAlign.center,
            ),
          ),
          backButton
              ? CustomPositionedIconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios),
                  width: height,
                  height: height,
                  left: 7.47.w,
                  iconSize: 2.9.h,
                )
              : Container(),
        ],
      ),
    );
  }
}

// InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                   margin: EdgeInsets.only(
//                     left: 3.2.h,
//                   ),
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     color: AppColors.darkBrown,
//                     size: 2.9.h,
//                   ),
//                 ),
//               )