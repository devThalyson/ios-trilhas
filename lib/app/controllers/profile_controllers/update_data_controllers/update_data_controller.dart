import 'package:app_trilhas/app/controllers/home_controllers/home_section_controller/home_section_controller.dart';
import 'package:app_trilhas/app/models/user.dart';
import 'package:app_trilhas/shared/utils/api_response.dart';
import 'package:app_trilhas/shared/utils/firebase_references.dart';
import 'package:app_trilhas/shared/validations/validations.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'update_data_controller.g.dart';

class UpdateDataController = _UpdateDataControllerBase
    with _$UpdateDataController;

abstract class _UpdateDataControllerBase with Store {
  //Observables

  @observable
  TextEditingController nameTextForm = TextEditingController();

  @observable
  TextEditingController birthDateTextForm = TextEditingController();

  @observable
  TextEditingController cityTextForm = TextEditingController();

  @observable
  TextEditingController emailTextForm = TextEditingController();

  @observable
  TextEditingController passwordTextForm = TextEditingController();

  @observable
  bool? updateDataFormIsValid;

  @observable
  bool updateDataProgress = false;

  @observable
  String nameValidateMensage = '';

  @observable
  String emailValidateMensage = '';

  @observable
  String birthDateValidateMensage = '';

  @observable
  String passwordValidateMensage = '';

  @observable
  String updateDataMensage = '';

  @observable
  User? user;

  @observable
  bool loadUserDateProgress = false;

  @observable
  String actualEmail = '';

  //Actions

  @action
  loadUserData(BuildContext context) async {
    loadUserDateProgress = true;
    user = await Provider.of<FirebaseReferences>(context, listen: false)
        .loadUserData();

    nameTextForm.text = user!.name!;

    if (user!.birthDate != null) {
      birthDateTextForm.text = user!.birthDate!;
    }

    emailTextForm.text = user!.email!;
    actualEmail = user!.email!;

    loadUserDateProgress = false;
  }

  @action
  checkIfUpdateDataFormIsValid() {
    nameValidator();
    birthDateValidator();
    emailValidator();
    passwordValidator();

    if (nameValidateMensage.isEmpty &&
        birthDateValidateMensage.isEmpty &&
        emailValidateMensage.isEmpty &&
        passwordValidateMensage.isEmpty) {
      updateDataFormIsValid = true;
    } else {
      updateDataFormIsValid = false;
    }
  }

  @action
  updateData(BuildContext context) async {
    checkIfUpdateDataFormIsValid();

    if (updateDataFormIsValid!) {
      User user = User(
        birthDate: birthDateTextForm.text,
        email: emailTextForm.text,
        name: nameTextForm.text,
      );
      updateDataProgress = true;
      ApiResponse response =
          await Provider.of<FirebaseReferences>(context, listen: false)
              .updateUserData(user, actualEmail, passwordTextForm.text);
      updateDataProgress = false;

      if (response.ok!) {
        passwordTextForm.text = '';
        updateDataMensage = 'Dados atualizados com sucesso!';
        await Provider.of<HomeSectionController>(context, listen: false)
            .loadCurrentUser(context);
        return true;
      } else {
        updateDataMensage = response.msg!;
        return false;
      }
    }
  }

  // Validators
  nameValidator() {
    nameValidateMensage = Validations.nameValidator(nameTextForm.text);
  }

  birthDateValidator() {
    birthDateValidateMensage = Validations.birthDateValidator(
      birthDateTextForm.text,
    );
  }

  emailValidator() {
    emailValidateMensage = Validations.emailValidator(emailTextForm.text);
  }

  passwordValidator() {
    passwordValidateMensage =
        Validations.actualPasswordValidator(passwordTextForm.text);
  }
}
