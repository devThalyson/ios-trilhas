import 'dart:io';

import 'package:app_trilhas/app/models/eco_tourism.dart';
import 'package:app_trilhas/shared/utils/firebase_references.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
part 'tourism_controller.g.dart';

class TourismController = _TourismControllerBase with _$TourismController;

abstract class _TourismControllerBase with Store {
  // Observables
  @observable
  int carrouselIndex = 0;

  // Actions
  @action
  catchCarrouselIndex(int value) {
    carrouselIndex = value;
  }

  @action
  shareTourism(
      BuildContext context, String imageUrl, Ecotourism tourism) async {
    String shareMensage = '';
    var database =
        Provider.of<FirebaseReferences>(context, listen: false).database;

    final response = await database.child('shareMensage').once();

    shareMensage = response.value;
    String mensageBody = '';
    if (tourism.about!.length > 120) {
      mensageBody =
          tourism.about!.replaceRange(119, tourism.about!.length, '...');
    } else {
      mensageBody = tourism.about!;
    }
    if (Platform.isAndroid) {
      var url = imageUrl;
      var response = await http.get(Uri.parse(url));
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      File file = new File(join(documentDirectory.path, 'trail.png'));
      file.writeAsBytesSync(response.bodyBytes);

      await WcFlutterShare.share(
          sharePopupTitle: 'Compartilhar trilha',
          subject: '${tourism.title}',
          text: '*${tourism.title}* \n \n$mensageBody \n \n$shareMensage',
          fileName: 'trail.png',
          mimeType: 'image/png',
          bytesOfFile: file.readAsBytesSync());
    } else {
      await WcFlutterShare.share(
        sharePopupTitle: 'Compartilhar trilha',
        subject: '${tourism.title}',
        text: '*${tourism.title}* \n \n$mensageBody \n \n$shareMensage',
        mimeType: 'plain/text',
      );
    }
  }
}
