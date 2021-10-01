import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomListTile extends StatelessWidget {
  final double height;
  final String titleText;
  final IconData iconData;
  final Function function;

  const CustomListTile(
      {Key? key,
      required this.titleText,
      required this.iconData,
      required this.function,
      this.height = 45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      child: ListTile(
        contentPadding: EdgeInsets.only(
          left: 5.34.w,
        ),
        onTap: () {
          function();
        },
        leading: Icon(
          iconData,
          size: 20,
          color: AppColors.thirdColor,
        ),
        minLeadingWidth: 0,
        horizontalTitleGap: 10,
        title: CustomText(
          texto: titleText,
          tamanhoFonte: 12.sp,
          cor: AppColors.darkBrown,
        ),
      ),
    );
  }
}
