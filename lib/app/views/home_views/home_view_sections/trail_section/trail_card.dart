import 'package:app_trilhas/app/models/custom_image.dart';
import 'package:app_trilhas/app/models/trail.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_decoration_properties/custom_box_shadow.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TrailCard extends StatelessWidget {
  final Trail trail;

  TrailCard(
    this.trail,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 2.45.h,
        right: 2.45.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 23.h,
            height: 22.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [CustomBoxShadow(opacity: 0.12)],
            ),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              imageUrl: _getCoverImage(trail.images!),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 1.47.h,
          ),
          Flexible(
            child: CustomText(
              texto: trail.title!,
              cor: AppColors.darkBrown,
              tamanhoFonte: 13.sp,
              textAlign: TextAlign.left,
              overFlow: true,
              maxLines: 2,
            ),
          ),
          SizedBox(
            height: 0.98.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                texto: trail.difficulty!,
                tamanhoFonte: 9.sp,
                cor: AppColors.grey,
              ),
              CustomText(
                texto: trail.time!,
                tamanhoFonte: 9.sp,
                cor: AppColors.grey,
              ),
              CustomText(
                texto: trail.distance!,
                tamanhoFonte: 9.sp,
                cor: AppColors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getCoverImage(List<CustomImage> images) {
    CustomImage image =
        images.where((element) => element.isCover == true).single;
    return image.url!;
  }
}
