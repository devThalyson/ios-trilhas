import 'package:app_trilhas/app/views/home_views/home_view.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/home_sections/partners_section/list_partners_view.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/home_sections/profile_sections/contact_section/contact_view.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/home_sections/profile_sections/faq_section/faq_view.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/home_sections/profile_sections/about_app_section/about_app_view.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/home_sections/profile_sections/terms_and_policies_section/terms_and_policies_view.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/home_sections/profile_sections/update_data_section/update_data_view.dart';
import 'package:app_trilhas/app/views/home_views/home_view_sections/home_sections/qr_code_sections/qr_code_section_view.dart';
import 'package:app_trilhas/app/views/splash_views/splash_view.dart';
import 'package:app_trilhas/app/views/user_views/login_view/login_view.dart';
import 'package:app_trilhas/app/views/user_views/password_recovery_view/password_recovery_view.dart';
import 'package:app_trilhas/app/views/user_views/sign_up_view/sign_up_sucess_view.dart';
import 'package:app_trilhas/app/views/user_views/sign_up_view/sign_up_view.dart';
import 'package:app_trilhas/app/views/user_views/user_home_view.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_fullscreen_image_widget/custom_fullscreen_image_widget.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> listRoutes = {
    // Routes

    // Rota da tela de splash screen
    "/": (BuildContext context) => SplashView(),

    // Rota da tela que agrupa as telas de login e cadatro
    "/userHomeView": (BuildContext context) => UserHomeView(),

    // Rota da tela de login
    "/loginView": (BuildContext context) => LoginView(),

    // Rota da tela de cadastro
    "/signUpView": (BuildContext context) => SignUpView(),

    // Rota da tela de confirmação de email (cadastro)
    "/signUpSucessView": (BuildContext context) => SignUpSucessView(),

    // Rota da tela de recuperação de senha
    "/passwordRecoveryView": (BuildContext context) => PasswordRecoveryView(),

    // Rota da tela inicial
    "/homeView": (BuildContext context) => HomeView(),

    // Rota da tela de que contém o leitor de qrCode
    "/qrCodeSectionView": (BuildContext context) => QrCodeSectionView(),

    // Rota da lista de parceiros do app
    "/listPartnersView": (BuildContext context) => ListPartnersView(),

    // Rota da tela onde o usuário vai atualizar seus dados
    "/updateDataView": (BuildContext context) => UpdateDataView(),

    // Rota da tela de informações sobre o app
    "/aboutAppView": (BuildContext context) => AboutAppView(),

    // Rota da tela de contato do app
    "/contactView": (BuildContext context) => ContactView(),

    // Rota da tela de termos de uso do app
    "/termsAndPoliciesView": (BuildContext context) => TermsAndPoliciesView(),

    // Rota da tela de FAQ
    "/faqView": (BuildContext context) => FaqView(),

    // Rota da tela que mostra uma imagem em tela cheia
    "/fullscreenImageView": (BuildContext context) =>
        CustomFullScreenImageWidget(
            ulr: ModalRoute.of(context)!.settings.arguments != null
                ? ModalRoute.of(context)!.settings.arguments as String
                : ''),

    // Rota de um item de trilha
    //"/trailItemView": (BuildContext context) => TrailItemView(),

    // Rota de um item de ecoturismo
    //"/tourismItemVew": (BuildContext context) => TourismItemView(),
  };
}
