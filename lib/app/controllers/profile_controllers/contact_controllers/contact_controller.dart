import 'package:flutter/cupertino.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mobx/mobx.dart';
part 'contact_controller.g.dart';

class ContactController = _ContactControllerBase with _$ContactController;

abstract class _ContactControllerBase with Store {
  // Observables
  @observable
  TextEditingController contactTextForm = TextEditingController();

  @observable
  String sendEmailValidateMensage = '';

  // Actions
  @observable
  bool sendEmailProgress = false;

  @action
  sendEmail() async {
    sendEmailValidator();
    if (sendEmailValidateMensage.isEmpty) {
      try {
        final Email email = Email(
          body: contactTextForm.text,
          subject: 'Contato com ecoturismo',
          recipients: ['ecoturismoitapma@gmail.com'],
          isHTML: false,
        );

        sendEmailProgress = true;
        await FlutterEmailSender.send(email);
        sendEmailProgress = false;
      } catch (e) {
        print(e);
        return false;
      }
    }
  }

  // Validators
  @action
  sendEmailValidator() {
    if (contactTextForm.text.length <= 18) {
      sendEmailValidateMensage =
          'Sua mensagem precisa ter no mínimo 18 Caracteres';
    } else {
      sendEmailValidateMensage = '';
    }
  }
}
