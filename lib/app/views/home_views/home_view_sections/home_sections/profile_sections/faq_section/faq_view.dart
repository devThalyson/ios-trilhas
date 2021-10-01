import 'package:app_trilhas/app/controllers/profile_controllers/redaction_controllers/faq_controllers/faq_controller.dart';
import 'package:app_trilhas/app/models/faq.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_animations/custom_progress_indicator.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_bars/custom_app_bar.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_cards/custom_scaffold_body.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_expansion_tile/custom_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

class FaqView extends StatefulWidget {
  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  final _controllerView = FaqController();

  @override
  void initState() {
    _controllerView.getFaqs(context);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
        top: 2.96.h,
      ),
      child: SafeArea(
        child: CustomScaffoldBody(
          topMargin: 0,
          bottomMargin: 0,
          leftMargin: 0,
          rightMargin: 0,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 3.8.h,
              ),
              child: CustomAppBar(title: 'FAQ'),
            ),
            Observer(
              builder: (_) {
                return _controllerView.getFaqsProgress
                    ? CustomProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _controllerView.faqs.length,
                        itemBuilder: (_, index) {
                          Faq faq = _controllerView.faqs[index];
                          return Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                              top: 3.h,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Divider(
                                      height: 1,
                                      color: Color(0xFFd8d8d8),
                                    ),
                                    CustomExpansionTile(
                                        title: faq.title!, content: faq.body!),
                                    Divider(
                                      height: 1,
                                      color: Color(0xFFd8d8d8),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
