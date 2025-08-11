
import 'package:change_wallet/src/presentations/pages/auth/registration/otp.dart';
import 'package:change_wallet/src/presentations/pages/auth/registration/success_page.dart';
import 'package:flutter/material.dart';


import '../../presentations/pages/auth/registration/create_access_code.dart';
import '../../presentations/pages/home_pages/about_app_page.dart';


import '../../presentations/pages/auth/edit_profile_page.dart';
import '../../presentations/pages/auth/login_page.dart';
import '../../presentations/pages/auth/profile_page.dart';
import '../../presentations/pages/auth/reset_password_page.dart';
import '../../presentations/pages/auth/registration/signup_page.dart';
import '../../presentations/pages/home_pages/accueil_page.dart';
import '../../presentations/pages/splash_first_page.dart';

import '../../presentations/pages/transactions/detail_transaction.dart';
import '../../presentations/pages/utils_pages/all_directories.dart';
import '../../utils/consts/routes/app_routes_name.dart';




class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings)
  {
    final args = settings.arguments;

    switch (settings.name){
      case AppRoutesName.splashFirstPage:
        return MaterialPageRoute( builder: (context) =>  const SplashPage());

      case AppRoutesName.aboutAppPage:
        return MaterialPageRoute( builder: (context) =>  const AboutAppPage());

      case AppRoutesName.accueilPage:
        return MaterialPageRoute( builder: (context) =>  const AccueilPage());

        // ------------------ auth
      case AppRoutesName.loginPage:
        return MaterialPageRoute( builder: (context) =>  const LoginPage());

      case AppRoutesName.profilPage:
        return MaterialPageRoute( builder: (context) =>  const ProfilePage());

      case AppRoutesName.editProfilPage:
        return MaterialPageRoute( builder: (context) =>  const EditProfilePage());

      case AppRoutesName.resetPwdPage:
        return MaterialPageRoute( builder: (context) =>  const ResetPasswordPage());

        case AppRoutesName.signUpPage:
        return MaterialPageRoute( builder: (context) =>  const SignupPage());
      case AppRoutesName.otpPage:
        return MaterialPageRoute( builder: (context) =>  const OtpVerificationPage( phoneController:"000" , nameController: "000", ));

      case AppRoutesName.createPwdPage:
      return MaterialPageRoute( builder: (context) =>  const AccessCodePage(phoneController:"000" , nameController: "000",));

      case AppRoutesName.successPage:
      return MaterialPageRoute( builder: (context) =>  const SuccessPage());


      case AppRoutesName.detailTransaction:
        return MaterialPageRoute( builder: (context) =>  const  DetailTransaction());


      case AppRoutesName.blankPage:
        return MaterialPageRoute(  builder: (context) => const BlankPage());

      default :
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
            builder: (context){
    return const ErrorScreen();
        }
    );
  }


}