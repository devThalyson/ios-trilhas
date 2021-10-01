import 'package:app_trilhas/app/models/term.dart';
import 'package:app_trilhas/shared/utils/firebase_references.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'terms_controller.g.dart';

class TermsController = _TermsControllerBase with _$TermsController;

abstract class _TermsControllerBase with Store {
  // Observables
  @observable
  List<Term> terms = ObservableList<Term>();

  @observable
  bool getTermsProgress = false;

  // Actions
  @action
  getTerms(BuildContext context) async {
    terms.clear();

    var database =
        Provider.of<FirebaseReferences>(context, listen: false).database;

    getTermsProgress = true;
    var response = await database.child('redaction').child('terms').once();
    getTermsProgress = false;

    List listResponse = response.value;

    listResponse.forEach((element) {
      Map<String, dynamic> map = Map<String, dynamic>.from(element);

      Term term = Term.fromJson(map);

      terms.add(term);
    });

    getTermsProgress = false;
  }
}
