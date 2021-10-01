import 'package:app_trilhas/app/models/about.dart';
import 'package:app_trilhas/shared/utils/firebase_references.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'about_controller.g.dart';

class AboutController = _AboutControllerBase with _$AboutController;

abstract class _AboutControllerBase with Store {
  // Observables

  @observable
  bool getAboutProgress = false;

  @observable
  About? about;

  // Actions
  @action
  getAbout(BuildContext context) async {
    var database =
        Provider.of<FirebaseReferences>(context, listen: false).database;

    getAboutProgress = true;
    var response = await database.child('redaction').child('about').once();

    Map<String, dynamic> map = Map<String, dynamic>.from(response.value);

    about = About.fromJson(map);

    getAboutProgress = false;
  }
}
