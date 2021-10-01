import 'package:app_trilhas/app/models/partner.dart';
import 'package:app_trilhas/shared/utils/firebase_references.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'partners_controller.g.dart';

class PartnersController = _PartnersControllerBase with _$PartnersController;

abstract class _PartnersControllerBase with Store {
  // Observables
  @observable
  List<Partner> partners = ObservableList<Partner>();

  @observable
  bool getPartnersProgress = false;

  // Actions
  @action
  getPartners(BuildContext context) async {
    var database =
        Provider.of<FirebaseReferences>(context, listen: false).database;

    getPartnersProgress = true;
    var response = await database.child('partners').once();

    List listResponse = response.value;

    listResponse.forEach((element) {
      partners.clear();

      listResponse.forEach((element) {
        Map<String, dynamic> map = Map<String, dynamic>.from(element);

        Partner partner = Partner.fromJson(map);
        partners.add(partner);
      });
    });

    getPartnersProgress = false;
  }
}
