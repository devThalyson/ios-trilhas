import 'package:app_trilhas/app/controllers/home_controllers/home_controller.dart';
import 'package:app_trilhas/app/controllers/home_controllers/home_section_controller/home_section_controller.dart';
import 'package:app_trilhas/app/controllers/home_controllers/tourism_controllers/tourism_controller.dart';
import 'package:app_trilhas/app/controllers/user_controllers/sign_up_controllers/sign_up_controller.dart';
import 'package:app_trilhas/app/controllers/weather_controllers/wheater_controller.dart';
import 'package:app_trilhas/shared/navigation/routes/routes.dart';
import 'package:app_trilhas/shared/theme/app_theme/app_theme.dart';
import 'package:app_trilhas/shared/utils/firebase_references.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'app/controllers/home_controllers/trail_controllers/trail_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Only portrait up allowed
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            Provider<FirebaseReferences>(
              create: (context) => FirebaseReferences(),
            ),
            Provider<SignUpController>(
              create: (context) => SignUpController(),
            ),
            Provider<HomeController>(
              create: (context) => HomeController(),
            ),
            Provider<HomeSectionController>(
              create: (context) => HomeSectionController(),
            ),
            Provider<TrailController>(
              create: (context) => TrailController(),
            ),
            Provider<TourismController>(
              create: (context) => TourismController(),
            ),
            Provider<WeatherController>(
              create: (context) => WeatherController(),
            ),
          ],
          child: MaterialApp(
            title: 'Guia de Ecoturismo de Itapema',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: Routes.listRoutes,
            theme: AppTheme.appTheme,
          ),
        );
      },
    );
  }
}
