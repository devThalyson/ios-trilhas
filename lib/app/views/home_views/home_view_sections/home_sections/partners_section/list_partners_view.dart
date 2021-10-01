import 'package:app_trilhas/app/controllers/partners_controllers/partners_controller.dart';
import 'package:app_trilhas/app/models/partner.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/home_sections/partners_section/partners_card.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_animations/custom_progress_indicator.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_bars/custom_app_bar.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_cards/custom_scaffold_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

class ListPartnersView extends StatefulWidget {
  @override
  _ListPartnersViewState createState() => _ListPartnersViewState();
}

class _ListPartnersViewState extends State<ListPartnersView> {
  var _controllerView = PartnersController();

  @override
  void initState() {
    _controllerView.getPartners(context);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _backGround(context),
    );
  }

  _backGround(BuildContext context) {
    return Observer(
      builder: (_) {
        return SingleChildScrollView(
          physics: _controllerView.partners.length > 3
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
              _controllerView.getPartnersProgress
                  ? CustomProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    )
                  : _body(),
            ],
          ),
        );
      },
    );
  }

  _body() {
    return Container(
      margin: EdgeInsets.only(
        top: 2.96.h,
      ),
      child: SafeArea(
        child: CustomScaffoldBody(
          dynamicHeight: _controllerView.partners.length > 3,
          topMargin: 0,
          bottomMargin: 0,
          leftMargin: 0,
          rightMargin: 0,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 3.8.h,
              ),
              child: CustomAppBar(title: 'Parceiros'),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 6.93.w,
                right: 6.93.w,
                top: 2.h,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _controllerView.partners.length,
                itemBuilder: (context, index) {
                  Partner partner = _controllerView.partners[index];
                  return PartnersCard(partner);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
