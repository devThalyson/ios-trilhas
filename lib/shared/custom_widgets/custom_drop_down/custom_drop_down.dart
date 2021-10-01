import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

abstract class DropDownItem {
  String text();
  String doubleInformation();
}

class CustomDropDown<T> extends StatefulWidget {
  final State? parent;
  final List<T>? itens;
  final String? text;
  final T? value;
  final dynamic callback;
  final Color? textColor;
  final Color? dropDownColor;
  final Color? hintColor;
  final Color? iconColor;
  final bool doubleInformationDropDown;

  CustomDropDown(
      this.itens, this.text, this.value, ValueChanged<T> this.callback,
      {this.parent,
      this.textColor,
      this.dropDownColor,
      this.hintColor,
      this.iconColor,
      this.doubleInformationDropDown = false});

  @override
  CustomDropDownState createState() {
    return new CustomDropDownState();
  }
}

class CustomDropDownState<T extends DropDownItem>
    extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: widget.value,
      isExpanded: true,
      items: items(widget.textColor, widget.doubleInformationDropDown),
      dropdownColor: widget.dropDownColor != null
          ? widget.dropDownColor
          : Colors.blue[800],
      iconEnabledColor:
          widget.iconColor != null ? widget.iconColor : Colors.white,
      hint: CustomText(
        texto: widget.text!,
        cor: widget.hintColor != null ? widget.hintColor : Colors.white,
      ),
      onChanged: (newVal) {
        widget.callback(newVal);
      },
    );
  }

  items(Color? textColor, bool doubleInformationDropDown) {
    List<DropdownMenuItem<T>> list = widget.itens!.map<DropdownMenuItem<T>>(
      (val) {
        return !doubleInformationDropDown
            ? DropdownMenuItem<T>(
                value: val,
                child: CustomText(
                  texto: "${val.text()}",
                  tamanhoFonte: 15.sp,
                  cor: textColor != null ? textColor : Colors.white,
                ),
              )
            : DropdownMenuItem<T>(
                value: val,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      texto: "${val.text()}",
                      tamanhoFonte: 15.sp,
                      cor: textColor != null ? textColor : Colors.white,
                    ),
                    CustomText(
                      texto: "${val.doubleInformation}",
                      tamanhoFonte: 15.sp,
                      cor: textColor != null ? textColor : Colors.white,
                    ),
                  ],
                ),
              );
      },
    ).toList();

    return list;
  }
}
