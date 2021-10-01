import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPositionedIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget icon;
  final Color color;
  final double iconSize;
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  final double width;
  final double height;

  const CustomPositionedIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.color = AppColors.darkBrown,
    this.iconSize = 24.0,
    this.top,
    this.bottom,
    this.right,
    this.left,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconButton = IconButton(
      onPressed: onPressed,
      icon: icon,
      color: color,
      iconSize: this.iconSize,
      splashColor: Colors.transparent,
    );

    final iconButtonBox = Container(
      width: width,
      height: height,
      child: iconButton,
    );

    return Positioned(
        top: top != null ? top! - (height - iconButton.iconSize) / 2 : null,
        bottom: bottom != null
            ? bottom! - (height - iconButton.iconSize) / 2
            : null,
        right:
            right != null ? right! - (width - iconButton.iconSize) / 2 : null,
        left: left != null ? left! - (width - iconButton.iconSize) / 2 : null,
        child: iconButtonBox);
  }
}
