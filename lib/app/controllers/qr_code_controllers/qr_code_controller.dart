import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

part 'qr_code_controller.g.dart';

class QrCodeController = _QrCodeControllerBase with _$QrCodeController;

abstract class _QrCodeControllerBase with Store {
  // Observables

  @observable
  QRViewController? qrViewController;

  @observable
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @observable
  Barcode? qrResult;

  // Actions

  @action
  reassemble() async {
    if (Platform.isAndroid) {
      await qrViewController!.pauseCamera();
    } else if (Platform.isIOS) {
      qrViewController!.resumeCamera();
    }
  }

  @action
  changeQrViewController(QRViewController newQrViewController) {
    qrViewController = newQrViewController;

    qrViewController!.scannedDataStream.listen(
      (result) async {
        qrResult = result;

        if (qrResult != null) {
          await canLaunch(qrResult!.code)
              ? await launch(qrResult!.code)
              : print('Erro');
        }
      },
    );
  }

  @action
  dispose() {
    if (qrViewController != null) {
      qrViewController!.dispose();
    }
  }
}
