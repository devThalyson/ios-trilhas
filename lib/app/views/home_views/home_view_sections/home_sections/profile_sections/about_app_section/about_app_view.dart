import 'package:app_trilhas/app/controllers/profile_controllers/redaction_controllers/about_controllers/about_controller.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_animations/custom_progress_indicator.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_bars/custom_app_bar.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_cards/custom_scaffold_body.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

class AboutAppView extends StatefulWidget {
  @override
  _AboutAppViewState createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutAppView> {
  final _controllerView = AboutController();

  @override
  void initState() {
    _controllerView.getAbout(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Container(
      margin: EdgeInsets.only(
        top: 7.h,
      ),
      child: Column(
        children: [
          Flexible(
            child: CustomScaffoldBody(
              topMargin: 0,
              bottomMargin: 0,
              leftMargin: 0,
              rightMargin: 0,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 3.8.h,
                    bottom: 2.h,
                  ),
                  child: CustomAppBar(title: 'Sobre'),
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      left: 6.93.w,
                      right: 6.93.w,
                    ),
                    child: Observer(
                      builder: (_) {
                        return _controllerView.getAboutProgress
                            ? CustomProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              )
                            : Column(
                                children: [
                                  Column(
                                    children: [
                                      CustomText(
                                        texto:
                                            '''${_controllerView.about!.text}''',
                                        textAlign: TextAlign.justify,
                                        cor: AppColors.grey,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 50),
                                        alignment: Alignment.center,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              _controllerView.about!.image!,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              );
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
