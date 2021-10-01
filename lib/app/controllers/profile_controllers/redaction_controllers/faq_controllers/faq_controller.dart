import 'package:app_trilhas/app/models/faq.dart';
import 'package:app_trilhas/shared/utils/firebase_references.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'faq_controller.g.dart';

class FaqController = _FaqControllerBase with _$FaqController;

abstract class _FaqControllerBase with Store {
  // Observables
  @observable
  List<Faq> faqs = ObservableList<Faq>();

  @observable
  bool getFaqsProgress = false;

  // Actions
  @action
  getFaqs(BuildContext context) async {
    faqs.clear();

    var database =
        Provider.of<FirebaseReferences>(context, listen: false).database;

    getFaqsProgress = true;
    var response = await database.child('redaction').child('faqs').once();

    List listResponse = response.value;

    listResponse.forEach((element) {
      Map<String, dynamic> map = Map<String, dynamic>.from(element);

      Faq faq = Faq.fromJson(map);

      faqs.add(faq);
    });

    getFaqsProgress = false;
  }
}
