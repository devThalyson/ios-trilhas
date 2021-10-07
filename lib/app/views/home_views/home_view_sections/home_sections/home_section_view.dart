import 'package:app_trilhas/app/controllers/home_controllers/home_controller.dart';
import 'package:app_trilhas/app/controllers/home_controllers/home_section_controller/home_section_controller.dart';
import 'package:app_trilhas/app/controllers/weather_controllers/wheater_controller.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_alerts/custom_default_alert.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_animations/custom_progress_indicator.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_buttons/custom_positioned_icon_button.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_decoration_properties/custom_box_shadow.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_icons/custom_icons.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_list_tile/custom_list_tile.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/navigation/push_to_page/push.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeSectionView extends StatefulWidget {
  @override
  _HomeSectionViewState createState() => _HomeSectionViewState();
}

class _HomeSectionViewState extends State<HomeSectionView> {
  var _controllerView = HomeSectionController();
  var _weatherController = WeatherController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _controllerView =
        Provider.of<HomeSectionController>(context, listen: false);
    _controllerView.loadCurrentUser(context);

    _weatherController = Provider.of<WeatherController>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _body(),
      endDrawer: _drawer(),
      drawerScrimColor: AppColors.darkBrown.withOpacity(0.8),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 3.5.h,
          ),
          _weatherCard(),
          SizedBox(
            height: 3.06.h,
          ),
          _qrCodeCard(),
          SizedBox(
            height: 3.06.h,
          ),
          _navigationCards(),
          SizedBox(
            height: 3.06.h,
          ),
          _partnersCard(),
          SizedBox(
            height: 3.06.h,
          ),
        ],
      ),
    );
  }

  _drawer() {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            29,
          ),
          bottomLeft: Radius.circular(
            29,
          ),
        ),
        child: SizedBox(
          width: 80.w,
          child: Drawer(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                        top: 3.8.h,
                        left: 4.38.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Observer(
                            builder: (_) {
                              return CustomText(
                                texto: _controllerView.currentUser != null &&
                                        _controllerView
                                                .currentUser!.displayName !=
                                            null
                                    ? _controllerView.currentUser!.displayName!
                                    : 'Usuário',
                                tamanhoFonte: 16.sp,
                                bold: true,
                                cor: AppColors.darkBrown,
                              );
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            texto: _controllerView.currentUser != null &&
                                    _controllerView.currentUser!.email != null
                                ? _controllerView.currentUser!.email!
                                : 'email',
                            tamanhoFonte: 12.sp,
                            bold: false,
                            cor: AppColors.lightGrey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 9.h),
                    Padding(
                      padding: EdgeInsets.only(left: 4.53.w),
                      child: Column(
                        children: [
                          CustomListTile(
                            titleText: 'Atualizar dados',
                            iconData: Icons.account_circle_outlined,
                            function: () {
                              push(context: context, route: '/updateDataView');
                            },
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFd8d8d8),
                          ),
                          CustomListTile(
                            titleText: 'FAQ',
                            iconData: Icons.question_answer_outlined,
                            function: () {
                              push(context: context, route: '/faqView');
                            },
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFd8d8d8),
                          ),
                          CustomListTile(
                            titleText: 'Sobre',
                            iconData: Icons.business,
                            function: () {
                              push(context: context, route: '/aboutAppView');
                            },
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFd8d8d8),
                          ),
                          CustomListTile(
                            titleText: 'Contato',
                            iconData: Icons.contact_page_outlined,
                            function: () {
                              push(context: context, route: '/contactView');
                            },
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFd8d8d8),
                          ),
                          CustomListTile(
                            titleText: 'Termos e políticas',
                            iconData: Icons.document_scanner_outlined,
                            function: () {
                              push(
                                  context: context,
                                  route: '/termsAndPoliciesView');
                            },
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFd8d8d8),
                          ),
                          CustomListTile(
                            titleText: 'Sair',
                            iconData: Icons.logout,
                            function: () {
                              _signOut();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CustomPositionedIconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(CustomIcons.cancel_bold, size: 16),
                  top: 3.5.h,
                  right: 3.04.h,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _weatherCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(29),
          bottomLeft: Radius.circular(29),
        ),
        boxShadow: [CustomBoxShadow(opacity: 0.03)],
        color: Colors.white,
      ),
      height: 25.49.h,
      width: 100.w,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 2.96.h,
              left: 2.96.h,
              right: 3.04.h,
              bottom: 2.96.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  texto: 'Clima de hoje',
                  bold: true,
                  cor: AppColors.darkBrown,
                  tamanhoFonte: 16.5.sp,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                CustomText(
                  texto: 'Confira a previsão do tempo em Itapema',
                  cor: AppColors.lightGrey,
                  tamanhoFonte: 10.sp,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 2.96.h),
                    child: Observer(
                      builder: (_) {
                        return _weatherLogic();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomPositionedIconButton(
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
            icon: Icon(Icons.menu),
            top: 3.5.h,
            right: 3.04.h,
            width: 50,
            height: 50,
          )
        ],
      ),
    );
  }

  _qrCodeCard() {
    return InkWell(
      onTap: () {
        push(context: context, route: '/qrCodeSectionView');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [CustomBoxShadow()],
          color: Colors.white,
        ),
        margin: EdgeInsets.only(
          left: 2.96.h,
          right: 3.04.h,
        ),
        height: 10.29.h,
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.only(
            top: 1.85.h,
            left: 2.96.h,
            bottom: 0.5.h,
            // right: 4.68.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                    // right: 4.93.h,
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      texto: 'Para ler indicações das trilhas e',
                      textAlign: TextAlign.left,
                      cor: AppColors.lightGrey,
                      tamanhoFonte: 9.sp,
                    ),
                    CustomText(
                      texto: 'Informações sobre eventos',
                      textAlign: TextAlign.left,
                      cor: AppColors.lightGrey,
                      tamanhoFonte: 9.sp,
                    ),
                    SizedBox(
                      height: 0.4.h,
                    ),
                    CustomText(
                      texto: 'Acessar leitor QR code',
                      cor: AppColors.darkBrown,
                      tamanhoFonte: 12.sp,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 4.68.h,
                  bottom: 1.5.h,
                ),
                child: Icon(
                  Icons.qr_code_2,
                  size: 6.2.h,
                  color: AppColors.darkBrown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _navigationCards() {
    return Container(
      margin: EdgeInsets.only(
        left: 2.96.h,
        right: 3.04.h,
      ),
      width: double.infinity,
      //height: 19.85.h,
      height: 17.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: InkWell(
              onTap: () {
                Provider.of<HomeController>(context, listen: false)
                    .changePageToEspecificIndex(0);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [CustomBoxShadow()],
                  color: Colors.white,
                ),
                child: Container(
                  width: 100.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      CustomText(
                        texto: 'Ecoturismo',
                        tamanhoFonte: 13.sp,
                        cor: AppColors.darkBrown,
                      ),
                      Spacer(),
                      Image.asset(
                        'assets/images/icon_turism.png',
                        width: 4.9.h,
                        height: 4.9.h,
                        color: AppColors.darkBrown,
                      ),
                      Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 1.72.h,
          ),
          Flexible(
            child: InkWell(
              onTap: () {
                Provider.of<HomeController>(context, listen: false)
                    .changePageToEspecificIndex(2);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [CustomBoxShadow()],
                  color: Colors.white,
                ),
                child: Container(
                  width: 100.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      CustomText(
                        texto: 'Trilhas',
                        tamanhoFonte: 13.sp,
                        cor: AppColors.darkBrown,
                      ),
                      Spacer(),
                      Image.asset(
                        'assets/images/icon_trail.png',
                        width: 4.9.h,
                        height: 4.9.h,
                        color: AppColors.darkBrown,
                      ),
                      Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Flexible(
          //   child: InkWell(
          //     onTap: () {
          //       Provider.of<HomeController>(context, listen: false)
          //           .changePageToEspecificIndex(2);
          //     },
          //     child: Container(
          //       height: 19.85.h,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         boxShadow: [CustomBoxShadow()],
          //         color: Colors.white,
          //       ),
          //       child: Container(
          //         width: 100.w,
          //         child: Column(
          //           children: [
          //             Spacer(),
          //             SizedBox(
          //               height: 0.6.h,
          //             ),
          //             CustomText(
          //               texto: 'Trilhas',
          //               tamanhoFonte: 13.sp,
          //               cor: AppColors.darkBrown,
          //             ),
          //             Spacer(),
          //             Image.asset(
          //               'assets/images/icon_turism.png',
          //               width: 4.9.h,
          //               height: 4.9.h,
          //               color: AppColors.darkBrown,
          //             ),
          //             Spacer(
          //               flex: 2,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  _partnersCard() {
    return InkWell(
      onTap: () {
        push(context: context, route: '/listPartnersView');
      },
      child: Container(
        width: double.infinity,
        height: 22.5.h,
        margin: EdgeInsets.only(
          left: 2.96.h,
          right: 3.04.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [CustomBoxShadow()],
          color: Colors.white,
        ),
        child: Container(
          margin: EdgeInsets.only(
            left: 3.8.h,
            right: 3.8.h,
            top: 2.5.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                texto: 'Parceiros',
                cor: AppColors.darkBrown,
                tamanhoFonte: 13.sp,
              ),
              SizedBox(
                height: 1.0.h,
              ),
              CustomText(
                texto:
                    'Conheça alguns dos serviços prestados pelos parceiros do projeto "Guia de Ecoturismo de Itapema"',
                textAlign: TextAlign.center,
                cor: AppColors.grey,
                tamanhoFonte: 11.sp,
              ),
              Image.asset(
                'assets/images/handshake.png',
                color: AppColors.primaryColor,
                width: 8.5.h,
                height: 8.5.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  _signOut() {
    Alert(
      opacity: 0.88,
      title: 'Atenção',
      body: 'Você sairá do aplicativo! Deseja continuar?',
      okOrNot: true,
      function: () async {
        await _controllerView.signOut(context);
        push(context: context, route: '/userHomeView', replace: true);
      },
    ).showDialog(context);
  }

  _weatherLogic() {
    return _weatherController.getWeatherProgress
        ? CustomProgressIndicator(
            color: Theme.of(context).primaryColor,
          )
        : Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      _weatherController.weatherImagePath,
                      color: AppColors.primaryColor,
                    ),
                    Visibility(
                      child: SizedBox(width: 3.20.w),
                      visible: _weatherController.weatherTemperature != null,
                    ),
                    Visibility(
                      child: CustomText(
                        texto: '${_weatherController.weatherTemperature}' + '°',
                        tamanhoFonte: 20.sp,
                        cor: AppColors.lightBrown,
                      ),
                      visible: _weatherController.weatherTemperature != null,
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Center(
                child: CustomText(
                  texto: _weatherController.weatherMensage,
                  tamanhoFonte: 12.sp,
                  cor: AppColors.darkBrown,
                ),
              ),
            ],
          );
  }
}
