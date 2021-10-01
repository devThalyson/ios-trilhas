import 'package:app_trilhas/app/controllers/profile_controllers/redaction_controllers/terms_controllers/terms_controller.dart';
import 'package:app_trilhas/app/models/term.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_animations/custom_progress_indicator.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_bars/custom_app_bar.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_cards/custom_scaffold_body.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_expansion_tile/custom_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

class TermsAndPoliciesView extends StatefulWidget {
  @override
  _TermsAndPoliciesViewState createState() => _TermsAndPoliciesViewState();
}

class _TermsAndPoliciesViewState extends State<TermsAndPoliciesView> {
  final _controllerView = TermsController();

  @override
  void initState() {
    _controllerView.getTerms(context);
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
              child: CustomAppBar(title: 'Termos e políticas'),
            ),
            Observer(
              builder: (_) {
                return _controllerView.getTermsProgress
                    ? CustomProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      )
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          Term term = _controllerView.terms[index];
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
                                      indent: 1,
                                      height: 1,
                                      color: Color(0xFFd8d8d8),
                                    ),
                                    CustomExpansionTile(
                                      title: term.title!,
                                      content: term.body!,
                                    ),
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
                        itemCount: _controllerView.terms.length,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
