import 'package:app_trilhas/shared/custom_widgets/custom_decoration_properties/custom_box_shadow.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomExpansionTile extends StatefulWidget {
  final double? horizontalPadding;
  final String title;
  final String content;

  const CustomExpansionTile(
      {Key? key,
      required this.title,
      required this.content,
      this.horizontalPadding})
      : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool opened = false;

  @override
  Widget build(BuildContext context) {
    final double usedHorizontalPadding = widget.horizontalPadding ?? 5.33.w;

    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
            boxShadow: [CustomBoxShadow(opacity: opened ? 0.08 : 0)]),
        margin: EdgeInsets.only(bottom: opened ? 4 : 0),
        child: ExpansionTile(
          title: Text(widget.title, style: TextStyle(fontSize: 15.sp)),
          collapsedTextColor: Colors.black,
          collapsedIconColor: AppColors.grey,
          textColor: Colors.black,
          iconColor: Color(0xFF3b6458),
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          tilePadding: EdgeInsets.symmetric(horizontal: usedHorizontalPadding),
          childrenPadding:
              EdgeInsets.symmetric(horizontal: usedHorizontalPadding),
          onExpansionChanged: (isOpened) => setState(() => opened = isOpened),
          children: [
            CustomText(
              texto: widget.content,
              tamanhoFonte: 12.sp,
              cor: Colors.grey,
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
