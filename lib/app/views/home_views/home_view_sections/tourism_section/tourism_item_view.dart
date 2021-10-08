import 'dart:io';

import 'package:animations/animations.dart';
import 'package:app_trilhas/app/controllers/home_controllers/tourism_controllers/tourism_controller.dart';
import 'package:app_trilhas/app/models/custom_image.dart';
import 'package:app_trilhas/app/models/eco_tourism.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/trail_section/trail_item_view.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_buttons/custom_positioned_icon_button.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_cards/custom_scaffold_body.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_decoration_properties/custom_box_shadow.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_icons/custom_icons.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/navigation/push_to_page/push.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';

class TourismItemView extends StatelessWidget {
  final Ecotourism ecotourism;

  final Function closeContainer;

  final bool openNewPage;

  TourismItemView(
    this.ecotourism,
    this.closeContainer, {
    this.openNewPage = true,
  });

  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<TourismController>(context);

    return Scaffold(
      body: Stack(
        children: [
          SlidingUpPanel(
            backdropEnabled: true,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(29),
              topRight: Radius.circular(29),
            ),
            minHeight: 53.5.h,
            backdropOpacity: 0.8,
            //maxHeight: 100.h,
            // Assim ficaria com espaço mas bugado
            maxHeight: 80.h,
            panelBuilder: (controller) {
              return SingleChildScrollView(
                controller: controller,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 3.h,
                    right: 3.h,
                    bottom: 2.21.h,
                    top: 2.5.h,
                  ),
                  child: Column(
                    children: [
                      _about(ecotourism),
                      _trail(ecotourism),
                      SizedBox(
                        height: 3.06.h,
                      ),
                      _contact(
                        ecotourism,
                      ),
                      SizedBox(
                        height: 3.06.h,
                      ),
                      _address(
                        ecotourism,
                      ),
                    ],
                  ),
                ),
              );
            },
            body: _body(ecotourism, _controllerView, context),
          ),
          Positioned(
            top: 90.h,
            left: 2.45.h,
            right: 2.45.h,
            child: _mapButton(ecotourism, context),
          ),
          CustomPositionedIconButton(
            onPressed: () => closeContainer(),
            icon: Container(
              width: 4.93.h,
              height: 4.93.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 15.sp,
              ),
            ),
            width: 8.h,
            height: 8.h,
            top: !Platform.isIOS ? 6.5.h : 9.h,
            left: !Platform.isIOS ? 5.33.w : 7.w,
          ),
          CustomPositionedIconButton(
            onPressed: () {
              _controllerView.shareTourism(
                  context, _getTrailFitImage(ecotourism.images!), ecotourism);
            },
            icon: Container(
              width: 4.93.h,
              height: 4.93.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: Icon(
                CustomIcons.share,
                size: 12,
              ),
            ),
            width: 8.h,
            height: 8.h,
            top: !Platform.isIOS ? 6.5.h : 9.h,
            right: !Platform.isIOS ? 5.33.w : 7.w,
          ),
        ],
      ),
    );
  }

  _body(
    Ecotourism tourism,
    TourismController _controllerView,
    BuildContext context,
  ) {
    return SafeArea(
      child: Stack(
        children: [
          _carrousel(tourism, _controllerView, context),
          Container(
            margin: EdgeInsets.only(
              top: 26.h,
            ),
            alignment: Alignment.topCenter,
            child: _carouselIndexIndicator(
              tourism,
              _controllerView,
              context,
            ),
          ),

          // _shareAppBar(context),
          Container(
            margin: EdgeInsets.only(
              top: 32.84.h,
            ),
            child: _tourismInfosHeader(
              tourism,
              context,
            ),
          ),
        ],
      ),
    );
  }

  _carrousel(Ecotourism tourism, TourismController _controllerView,
      BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(),
      child: Material(
        color: Colors.transparent,
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: 35.66.h,
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            viewportFraction: 1,
            onPageChanged: (a, _) {
              _controllerView.catchCarrouselIndex(a);
            },
          ),
          itemCount: tourism.images!.length,
          itemBuilder: (_, index, __) {
            String imgUrl = tourism.images![index].url!;
            return GestureDetector(
              onTap: () {
                push(
                    context: context,
                    route: '/fullscreenImageView',
                    arguments: imgUrl);
              },
              child: Hero(
                tag: imgUrl,
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  fit: BoxFit.cover,
                  height: 100.h,
                  width: 100.w,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _carouselIndexIndicator(Ecotourism tourism, TourismController _controllerView,
      BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12,
            ),
            color: AppColors.darkBrown.withOpacity(0.4),
          ),
          child: Container(
            margin: EdgeInsets.all(
              1.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: tourism.images!.map(
                (url) {
                  int index = tourism.images!.indexOf(url);
                  return Container(
                    width: 0.8.h,
                    height: 0.8.h,
                    margin: EdgeInsets.symmetric(
                        vertical: 0.1.h, horizontal: 0.5.h),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _controllerView.carrouselIndex == index
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: AppColors.primaryColor,
                        )),
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
    );
  }

  _tourismInfosHeader(Ecotourism tourism, BuildContext context) {
    return CustomScaffoldBody(
      leftMargin: 3.h,
      rightMargin: 3.h,
      bottomMargin: 2.21.h,
      topMargin: 2.5.h,
      dynamicHeight: true,
      color: Theme.of(context).primaryColor,
      children: [
        CustomText(
          texto: tourism.title!,
          bold: true,
          cor: AppColors.darkBrown,
          tamanhoFonte: 16.sp,
        ),
      ],
    );
  }

  _about(Ecotourism tourism) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: AppColors.darkBrown,
              width: 0.28.h,
              height: 2.21.h,
              margin: EdgeInsets.only(
                right: 0.73.h,
              ),
            ),
            CustomText(
              texto: 'Sobre',
              cor: AppColors.darkBrown,
              tamanhoFonte: 11.sp,
            ),
          ],
        ),
        SizedBox(
          height: 1.59.h,
        ),
        CustomText(
          texto: tourism.about!,
          textAlign: TextAlign.left,
          cor: Colors.grey,
          tamanhoFonte: 11.sp,
        ),
      ],
    );
  }

  _trail(Ecotourism tourism) {
    return Column(
      children: [
        SizedBox(
          height: 3.06.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: AppColors.darkBrown,
              width: 0.28.h,
              height: 2.21.h,
              margin: EdgeInsets.only(
                right: 0.73.h,
              ),
            ),
            CustomText(
              texto: 'Trilha no local',
              cor: AppColors.darkBrown,
              tamanhoFonte: 11.sp,
            ),
          ],
        ),
        SizedBox(
          height: 1.59.h,
        ),
        openNewPage
            ? OpenContainer(
                transitionDuration: Duration(
                  milliseconds: 600,
                ),
                transitionType: ContainerTransitionType.fadeThrough,
                closedBuilder: (_, openContainer) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    height: 16.h,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      margin: EdgeInsets.only(
                        right: 1.47.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 20.h,
                            height: 12.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [CustomBoxShadow(opacity: 0.12)],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: CachedNetworkImage(
                              imageUrl:
                                  _getTrailFitImage(tourism.trail!.images!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          CustomText(
                            texto: ecotourism.trail!.title!,
                            tamanhoFonte: 10.sp,
                            cor: AppColors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                openBuilder: (_, closedContainer) {
                  return TrailItemView(
                    ecotourism.trail!,
                    closedContainer,
                    openNewPage: false,
                  );
                },
                closedElevation: 0,
              )
            : Container(
                alignment: Alignment.centerLeft,
                height: 16.h,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  margin: EdgeInsets.only(
                    right: 1.47.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 20.h,
                        height: 12.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [CustomBoxShadow(opacity: 0.12)],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: CachedNetworkImage(
                          imageUrl: _getTrailFitImage(tourism.trail!.images!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomText(
                        texto: ecotourism.trail!.title!,
                        tamanhoFonte: 10.sp,
                        cor: AppColors.grey,
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }

  _address(Ecotourism tourism) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 12.25.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: AppColors.darkBrown,
                width: 0.28.h,
                height: 2.21.h,
                margin: EdgeInsets.only(
                  right: 0.73.h,
                ),
              ),
              CustomText(
                texto: 'Endereço',
                cor: AppColors.darkBrown,
                tamanhoFonte: 11.sp,
              ),
            ],
          ),
          SizedBox(
            height: 1.59.h,
          ),
          CustomText(
            texto: tourism.address!,
            textAlign: TextAlign.left,
            cor: Colors.grey,
            tamanhoFonte: 11.sp,
          ),
        ],
      ),
    );
  }

  _contact(Ecotourism tourism) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: AppColors.darkBrown,
              width: 0.28.h,
              height: 2.21.h,
              margin: EdgeInsets.only(
                right: 0.73.h,
              ),
            ),
            CustomText(
              texto: 'Contato',
              cor: AppColors.darkBrown,
              tamanhoFonte: 11.sp,
            ),
          ],
        ),
        Visibility(
          visible: tourism.whatsapp != null && tourism.whatsapp!.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.59.h,
              ),
              CustomText(
                texto: 'Whatsapp: ' + tourism.whatsapp!,
                textAlign: TextAlign.left,
                cor: Colors.grey,
                tamanhoFonte: 11.sp,
              ),
            ],
          ),
        ),
        Visibility(
          visible: tourism.cellphone != null && tourism.cellphone!.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.59.h,
              ),
              CustomText(
                texto: 'Telefone fixo: ' + tourism.cellphone!,
                textAlign: TextAlign.left,
                cor: Colors.grey,
                tamanhoFonte: 11.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _mapButton(Ecotourism tourism, BuildContext context) {
    if (tourism.whatsapp != null && tourism.whatsapp!.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () async {
                await launch(tourism.map!);
              },
              child: Container(
                height: 6.39.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CustomIcons.map,
                      color: AppColors.darkBrown,
                      size: 18,
                    ),
                    SizedBox(
                      width: 1.47.h,
                    ),
                    CustomText(
                      texto: 'Abrir mapa',
                      cor: AppColors.darkBrown,
                      tamanhoFonte: 13.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 3.20.w),
          InkWell(
            onTap: () {
              String whatsapp = '';
              if (tourism.whatsapp != null) {
                whatsapp = tourism.whatsapp!
                    .replaceAll('(', '')
                    .replaceAll(')', '')
                    .replaceAll('-', '')
                    .replaceAll(' ', '');
              }
              launch('https://api.whatsapp.com/send?phone=$whatsapp',
                  forceSafariVC: true);
            },
            child: Container(
              width: 20.17.w,
              height: 6.39.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: Color(0xFF25d366),
              ),
              child: Center(
                child:
                    Icon(CustomIcons.whatsapp, color: Colors.white, size: 22),
              ),
            ),
          ),
        ],
      );
    } else if (tourism.cellphone != null && tourism.cellphone!.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () async {
                await launch(tourism.map!);
              },
              child: Container(
                height: 6.39.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CustomIcons.map,
                      color: AppColors.darkBrown,
                      size: 18,
                    ),
                    SizedBox(
                      width: 1.47.h,
                    ),
                    CustomText(
                      texto: 'Abrir mapa',
                      cor: AppColors.darkBrown,
                      tamanhoFonte: 13.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 3.20.w),
          InkWell(
            onTap: () {
              launch('tel://${tourism.cellphone}');
            },
            child: Container(
              width: 20.17.w,
              height: 6.39.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: Theme.of(context).primaryColor,
              ),
              child: Icon(Icons.phone, color: AppColors.darkBrown, size: 22),
            ),
          ),
        ],
      );
    } else {
      return InkWell(
        onTap: () async {
          await launch(tourism.map!);
        },
        child: Container(
          height: 6.39.h,
          width: 30.39.h,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CustomIcons.map,
                color: AppColors.darkBrown,
                size: 18,
              ),
              SizedBox(
                width: 1.47.h,
              ),
              CustomText(
                texto: 'Abrir mapa',
                cor: AppColors.darkBrown,
                tamanhoFonte: 13.sp,
              )
            ],
          ),
        ),
      );
    }
  }

  _getTrailFitImage(List<CustomImage> images) {
    CustomImage customImage =
        images.where((element) => element.isCover!).single;
    return customImage.url;
  }
}
