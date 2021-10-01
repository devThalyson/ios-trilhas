import 'package:app_trilhas/shared/utils/firebase_references.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'home_section_controller.g.dart';

class HomeSectionController = _HomeSectionControllerBase
    with _$HomeSectionController;

abstract class _HomeSectionControllerBase with Store {
  // Observables

  @observable
  User? currentUser;

  // Actions
  @action
  signOut(BuildContext context) async {
    await Provider.of<FirebaseReferences>(context, listen: false)
        .auth
        .signOut();
  }

  @action
  loadCurrentUser(BuildContext context) {
    currentUser = Provider.of<FirebaseReferences>(context, listen: false)
        .getCurrentUser();
  }
}
