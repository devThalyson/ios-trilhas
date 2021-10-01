import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomClipOval extends StatelessWidget {
  final Function? functionAddPhoto;
  final Function? functionRemovePhoto;
  final double? customWidht;
  final double? customHeight;
  final double? customActionPositionTop;
  final double? customActionPositionLeft;
  final double? customActionPositionTop2;
  final double? customActionPositionLeft2;
  final bool isEditing;
  final bool isDynamic;
  final bool setImage;
  final File? image;

  CustomClipOval({
    this.functionAddPhoto,
    this.functionRemovePhoto,
    this.customHeight,
    this.customWidht,
    this.customActionPositionTop,
    this.customActionPositionLeft,
    this.customActionPositionTop2,
    this.customActionPositionLeft2,
    this.isEditing = false,
    this.setImage = false,
    this.image,
    this.isDynamic = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      height: 45.w,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 18.0,
                  spreadRadius: 0.5,
                )
              ],
            ),
            child: ClipOval(
              child: Container(
                width: customWidht != null ? customWidht : 45.w,
                height: customHeight != null ? customHeight : 45.w,
                color: Colors.white,
                child: setImage
                    ? Image.file(
                        image!,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.person,
                        size: 50.sp,
                      ),
              ),
            ),
          ),
          Visibility(
            visible: isDynamic,
            child: Positioned(
              top: customActionPositionTop != null
                  ? customActionPositionTop
                  : 17.h,
              left: customActionPositionLeft != null
                  ? customActionPositionLeft
                  : 35.w,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: InkWell(
                    onTap: () {
                      functionAddPhoto!();
                    },
                    child: Container(
                      width: 9.2.w,
                      height: 9.2.w,
                      color: Colors.white,
                      child: Icon(
                        isEditing ? Icons.edit : Icons.camera_alt_outlined,
                        color: Colors.black,
                        size: 13.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: setImage,
            child: Positioned(
              top: customActionPositionTop2 != null
                  ? customActionPositionTop2
                  : 17.h,
              left: customActionPositionLeft2 != null
                  ? customActionPositionLeft2
                  : 10.w,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: InkWell(
                    onTap: () {
                      functionRemovePhoto!();
                    },
                    child: Container(
                      width: 9.2.w,
                      height: 9.2.w,
                      color: Colors.white,
                      child: Icon(
                        Icons.delete_sweep_outlined,
                        size: 13.sp,
                        color: Colors.red[900],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
