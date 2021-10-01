import 'package:animations/animations.dart';
import 'package:app_trilhas/app/controllers/home_controllers/home_controller.dart';
import 'package:app_trilhas/app/controllers/home_controllers/trail_controllers/trail_controller.dart';
import 'package:app_trilhas/app/controllers/weather_controllers/wheater_controller.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/home_sections/home_section_view.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/tourism_section/tourism_section_view.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/trail_section/trail_section_view.dart';

import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  var _controllerView = HomeController();
  var _trailController = TrailController();
  var _weatherController = WeatherController();

  @override
  void initState() {
    _controllerView = Provider.of<HomeController>(context, listen: false);
    _trailController = Provider.of<TrailController>(context, listen: false);
    _weatherController = Provider.of<WeatherController>(context, listen: false);
    _trailController.getTrails(context);
    _weatherController.getWeather();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _homeView(),
      bottomNavigationBar: _bottomNavigatorBar(),
    );
  }

  _homeView() {
    return Observer(
      builder: (_) {
        return PageTransitionSwitcher(
          duration: Duration(
            milliseconds: 700,
          ),
          transitionBuilder: (Widget child, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: _listWidgets()[_controllerView.pageIndex],
        );

        //return IndexedStack(
        //  children: _listWidgets(),
        //  index: _controllerView.pageIndex,
        //);
      },
    );
  }

  _listWidgets() {
    List<Widget> pageList = <Widget>[
      TouristmSectionView(),
      HomeSectionView(),
      TrailSectionView(),
    ];
    return pageList;
  }

  _bottomNavigatorBar() {
    return Observer(
      builder: (_) {
        return Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            items: [
              _bottomNavigatorBarItem(
                imageUrl: 'assets/images/icon_turism.png',
                label: 'Ecoturismo',
              ),
              _bottomNavigatorBarItem(
                imageUrl: 'assets/images/icon_home.png',
                label: 'Home',
              ),
              _bottomNavigatorBarItem(
                imageUrl: 'assets/images/icon_trail.png',
                label: 'Trilhas',
              ),
            ],
            elevation: 30,
            currentIndex: _controllerView.pageIndex,
            type: BottomNavigationBarType.fixed,
            onTap: _controllerView.changePageIndex,
            selectedLabelStyle: TextStyle(
              fontSize: 0.sp,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 0.sp,
            ),
            backgroundColor: Colors.white,
          ),
        );
      },
    );
  }

  _bottomNavigatorBarItem({
    required String imageUrl,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imageUrl,
              height: 3.10.h,
              width: 3.10.h,
              color: AppColors.grey,
            ),
            CustomText(
              texto: label,
              tamanhoFonte: 9.sp,
              cor: AppColors.grey,
            ),
          ],
        ),
      ),
      activeIcon: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imageUrl,
              height: 3.45.h,
              width: 3.45.h,
              color: AppColors.darkBrown,
            ),
            CustomText(
              texto: label,
              tamanhoFonte: 11.sp,
              cor: AppColors.darkBrown,
            ),
          ],
        ),
      ),
      label: '',
    );
  }
}
