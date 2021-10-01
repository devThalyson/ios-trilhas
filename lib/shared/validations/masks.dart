import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Masks {
  static var birthDateMask = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
}
