import 'package:email_validator/email_validator.dart';

class Validations {
  static String emailValidator(String email) {
    if (!EmailValidator.validate(email)) {
      return "Insira um e-mail válido";
    } else {
      return '';
    }
  }

  static String nameValidator(String name) {
    if (name.length < 3) {
      return "Mínimo de 3 caracteres";
    } else {
      return '';
    }
  }

  static String birthDateValidator(String birthDate) {
    if (birthDate.length != 10) {
      return "Data de nascimento inválida";
    } else {
      return '';
    }
  }

  static String passwordValidator(String password) {
    if (password.length < 5) {
      return "Mínimo de 5 caracteres";
    } else {
      return '';
    }
  }

  static String repeatedPasswordValidator(
      String password, String repeatedPassword) {
    if (repeatedPassword != password) {
      return "As senhas não coicidem";
    } else {
      return '';
    }
  }

  static String actualPasswordValidator(String password) {
    if (password.length < 5) {
      return "Insira uma senha válida";
    } else {
      return '';
    }
  }
}
