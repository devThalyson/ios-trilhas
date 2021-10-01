import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomRadioButton extends StatelessWidget {
  final String text;
  final int groupValue;
  final int value;
  final Function onChanged;
  final Color textColor;
  final Color? buttonColor;
  final bool isBold;
  final double? tamanhoFont;
  final Icon? icon;
  final String? descriptionField;

  CustomRadioButton(
    this.text,
    this.groupValue,
    this.value,
    this.onChanged, {
    this.textColor = Colors.white,
    this.isBold = false,
    this.tamanhoFont,
    this.buttonColor,
    this.icon,
    this.descriptionField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: Radio(
                value: value,
                groupValue: groupValue,
                onChanged: (value) {
                  onChanged(value);
                },
                activeColor: buttonColor != null ? buttonColor : Colors.white,
              ),
            ),
            Container(
              child: CustomText(
                texto: text,
                cor: textColor,
                bold: isBold,
                tamanhoFonte: tamanhoFont != null ? tamanhoFont : 13.sp,
              ),
            ),
            SizedBox(
              width: 1.5.w,
            ),
            Visibility(
              visible: icon != null,
              child: icon != null ? icon! : Container(),
            )
          ],
        ),
        Visibility(
          visible: descriptionField != null,
          child: descriptionField != null
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: 2.5.h,
                  ),
                  child: CustomText(
                    texto: descriptionField!,
                    cor: Colors.black,
                    textAlign: TextAlign.center,
                    tamanhoFonte: 12.sp,
                  ),
                )
              : Container(),
        ),
      ],
    );
  }
}
