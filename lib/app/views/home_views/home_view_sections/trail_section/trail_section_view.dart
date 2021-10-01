import 'dart:io';

import 'package:animations/animations.dart';
import 'package:app_trilhas/app/controllers/home_controllers/trail_controllers/trail_controller.dart';
import 'package:app_trilhas/app/models/trail.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/trail_section/trail_card.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/trail_section/trail_item_view.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_animations/custom_progress_indicator.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_bars/custom_app_bar.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_cards/custom_scaffold_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TrailSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<TrailController>(context);
    return Scaffold(
      appBar: Platform.isIOS
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 0.1.h,
            )
          : null,
      body: _backGround(context, _controllerView),
    );
  }

  _backGround(BuildContext context, TrailController _controllerView) {
    return Observer(
      builder: (_) {
        return SingleChildScrollView(
          physics: _controllerView.trails.length > 4
              ? null
              : NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                color: Theme.of(context).primaryColor,
              ),
              Positioned(
                top: 3.7.h,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 2.96.h,
                  ),
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        29,
                      ),
                      topRight: Radius.circular(
                        29,
                      ),
                    ),
                  ),
                ),
              ),
              _controllerView.getTrailsProgress
                  ? CustomProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    )
                  : _body(_controllerView),
            ],
          ),
        );
      },
    );
  }

  _body(TrailController _controllerView) {
    return Container(
      margin: EdgeInsets.only(
        top: 2.9.h,
      ),
      child: SafeArea(
        child: CustomScaffoldBody(
          dynamicHeight: _controllerView.trails.length > 4 ? true : false,
          topMargin: 0,
          bottomMargin: 0,
          leftMargin: 0,
          rightMargin: 0,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 3.8.h,
              ),
              child: CustomAppBar(
                title: 'Trilhas',
                backButton: false,
              ),
            ),
            SizedBox(
              height: 2.94.h,
            ),
            Container(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.41.h,
                  mainAxisExtent: 33.h,
                ),
                itemCount: _controllerView.trails.length,
                itemBuilder: (context, index) {
                  Trail trail = _controllerView.trails[index];

                  //return InkWell(
                  //  onTap: () {
                  //    push(
                  //        context: context,
                  //        route: '/trailItemView',
                  //        arguments: trail);
                  //  },
                  //  child: TrailCard(trail),
                  // );

                  return OpenContainer(
                    transitionDuration: Duration(
                      milliseconds: 600,
                    ),
                    transitionType: ContainerTransitionType.fadeThrough,
                    closedBuilder: (_, openContainer) {
                      return TrailCard(trail);
                    },
                    openBuilder: (_, closedContainer) {
                      return TrailItemView(trail, closedContainer);
                    },
                    closedElevation: 0,
                  );
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
