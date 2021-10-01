import 'package:app_trilhas/app/models/custom_image.dart';
import 'package:app_trilhas/app/models/eco_tourism.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_decoration_properties/custom_box_shadow.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TourismCard extends StatelessWidget {
  final Ecotourism ecotourism;

  TourismCard(this.ecotourism);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
        bottom: 2.94.h,
        right: 3.67.h,
        left: 2.57.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            texto: ecotourism.title!,
            tamanhoFonte: 13.sp,
            cor: AppColors.darkBrown,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 1.72.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 18.26.h,
                width: 19.73.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [CustomBoxShadow(opacity: 0.12)],
                ),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl: _getCoverImage(ecotourism.images!),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 1.84.h,
              ),
              Flexible(
                child: CustomText(
                  texto: ecotourism.about!,
                  cor: AppColors.grey,
                  overFlow: true,
                  maxLines: 7,
                  textAlign: TextAlign.left,
                  tamanhoFonte: 11.sp,
                ),
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
