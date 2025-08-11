import 'package:flutter/material.dart';


import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

import '../../utils/consts/app_specifications/allDirectories.dart';

import 'home_pages/about_app_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(


        body:SplashView(

          bottomLoading: true,

          backgroundColor: Colors.grey.shade300,

          logo: Image.asset(AppImages.APP_BACKGROUND),

          done: Done(const AboutAppPage()),

          loadingIndicator: LinearProgressIndicator(color: AppColors.mainAppColor,),

        )
    );
  }
}