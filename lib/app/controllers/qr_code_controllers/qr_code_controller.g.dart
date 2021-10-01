// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QrCodeController on _QrCodeControllerBase, Store {
  final _$qrViewControllerAtom =
      Atom(name: '_QrCodeControllerBase.qrViewController');

  @override
  QRViewController? get qrViewController {
    _$qrViewControllerAtom.reportRead();
    return super.qrViewController;
  }

  @override
  set qrViewController(QRViewController? value) {
    _$qrViewControllerAtom.reportWrite(value, super.qrViewController, () {
      super.qrViewController = value;
    });
  }

  final _$qrKeyAtom = Atom(name: '_QrCodeControllerBase.qrKey');

  @override
  GlobalKey<State<StatefulWidget>> get qrKey {
    _$qrKeyAtom.reportRead();
    return super.qrKey;
  }

  @override
  set qrKey(GlobalKey<State<StatefulWidget>> value) {
    _$qrKeyAtom.reportWrite(value, super.qrKey, () {
      super.qrKey = value;
    });
  }

  final _$qrResultAtom = Atom(name: '_QrCodeControllerBase.qrResult');

  @override
  Barcode? get qrResult {
    _$qrResultAtom.reportRead();
    return super.qrResult;
  }

  @override
  set qrResult(Barcode? value) {
    _$qrResultAtom.reportWrite(value, super.qrResult, () {
      super.qrResult = value;
    });
  }

  final _$reassembleAsyncAction =
      AsyncAction('_QrCodeControllerBase.reassemble');

  @override
  Future reassemble() {
    return _$reassembleAsyncAction.run(() => super.reassemble());
  }

  final _$_QrCodeControllerBaseActionController =
      ActionController(name: '_QrCodeControllerBase');

  @override
  dynamic changeQrViewController(QRViewController newQrViewController) {
    final _$actionInfo = _$_QrCodeControllerBaseActionController.startAction(
        name: '_QrCodeControllerBase.changeQrViewController');
    try {
      return super.changeQrViewController(newQrViewController);
    } finally {
      _$_QrCodeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_QrCodeControllerBaseActionController.startAction(
        name: '_QrCodeControllerBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_QrCodeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
qrViewController: ${qrViewController},
qrKey: ${qrKey},
qrResult: ${qrResult}
    ''';
  }
}
