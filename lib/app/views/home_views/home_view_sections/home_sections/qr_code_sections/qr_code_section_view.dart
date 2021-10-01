import 'package:app_trilhas/app/controllers/qr_code_controllers/qr_code_controller.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_bars/custom_app_bar.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_cards/custom_scaffold_body.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';

class QrCodeSectionView extends StatefulWidget {
  @override
  _QrCodeSectionViewState createState() => _QrCodeSectionViewState();
}

class _QrCodeSectionViewState extends State<QrCodeSectionView> {
  final _controllerView = QrCodeController();

  @override
  void reassemble() {
    _controllerView.reassemble();
    super.reassemble();
  }

  @override
  void dispose() {
    _controllerView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 2.96.h,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CustomScaffoldBody(
                topMargin: 0,
                bottomMargin: 0,
                leftMargin: 0,
                rightMargin: 0,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 3.8.h,
                    ),
                    child: CustomAppBar(title: 'QR Code'),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 14.3.w,
                      right: 14.3.w,
                      top: 1.97.h,
                    ),
                    alignment: Alignment.center,
                    child: CustomText(
                      texto:
                          'Centralize o QR CODE na tela do seu aparelho para ser redirecionado',
                      textAlign: TextAlign.center,
                      tamanhoFonte: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 4.19.h,
                  ),
                  Container(
                    width: 100.w,
                    height: 74.4.h,
                    child: QRView(
                      key: _controllerView.qrKey,
                      onQRViewCreated: _controllerView.changeQrViewController,
                      overlay: QrScannerOverlayShape(
                        borderColor: Theme.of(context).primaryColor,
                        cutOutSize: 80.w,
                        borderWidth: 10.sp,
                        borderLength: 10.sp,
                        borderRadius: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
