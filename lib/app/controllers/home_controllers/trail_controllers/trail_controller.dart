import 'dart:io';

import 'package:app_trilhas/app/models/eco_tourism.dart';
import 'package:app_trilhas/app/models/trail.dart';
import 'package:app_trilhas/shared/utils/firebase_references.dart';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

part 'trail_controller.g.dart';

class TrailController = _TrailControllerBase with _$TrailController;

abstract class _TrailControllerBase with Store {
  // Observables
  @observable
  List<Trail> trails = ObservableList<Trail>();

  @observable
  List<Ecotourism> ecotourisms = ObservableList<Ecotourism>();

  @observable
  bool getTrailsProgress = false;

  @observable
  int carrouselIndex = 0;

  @observable
  double trailsInfoBodyTopMarging = 50.h;

  @observable
  ScrollController scrollController = ScrollController();

  // Actions

  @action
  getTrails(BuildContext context) {
    var database =
        Provider.of<FirebaseReferences>(context, listen: false).database;

    database.child('trails').onValue.listen((event) {
      getTrailsProgress = true;
      trails.clear();
      ecotourisms.clear();

      List<dynamic> listTrails = event.snapshot.value;

      listTrails.forEach((element) {
        Map<String, dynamic> map = Map<String, dynamic>.from(element);

        Trail trail = Trail.fromJson(map);

        if (trail.ecotourisms != null) {
          trail.ecotourisms!.forEach((element) {
            element.trail = trail;
            ecotourisms.add(element);
          });
        }

        trails.add(trail);
      });

      getTrailsProgress = false;
    });
  }

  @action
  catchCarrouselIndex(int value) {
    carrouselIndex = value;
  }

  @action
  shareTrail(BuildContext context, String imageUrl, Trail trail) async {
    String shareMensage = '';
    var database =
        Provider.of<FirebaseReferences>(context, listen: false).database;

    final response = await database.child('shareMensage').once();

    shareMensage = response.value;

    String mensageBody = '';
    if (trail.about!.length > 120) {
      mensageBody = trail.about!.replaceRange(119, trail.about!.length, '...');
    } else {
      mensageBody = trail.about!;
    }
    if (Platform.isAndroid) {
      var url = imageUrl;
      var response = await http.get(Uri.parse(url));
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      File file = new File(join(documentDirectory.path, 'trail.png'));
      file.writeAsBytesSync(response.bodyBytes);

      await WcFlutterShare.share(
          sharePopupTitle: 'Compartilhar trilha',
          subject: '${trail.title}',
          text: '*${trail.title}* \n \n$mensageBody \n \n$shareMensage',
          fileName: 'trail.png',
          mimeType: 'image/png',
          bytesOfFile: file.readAsBytesSync());
    } else {
      await WcFlutterShare.share(
        sharePopupTitle: 'Compartilhar trilha',
        subject: '${trail.title}',
        text: '*${trail.title}* \n \n$mensageBody \n \n$shareMensage',
        mimeType: 'plain/text',
      );
    }
  }
}
