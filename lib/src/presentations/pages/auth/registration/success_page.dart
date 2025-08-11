
import 'package:flutter/material.dart';

import '../../../../utils/consts/app_specifications/allDirectories.dart';
import '../../../../utils/consts/routes/app_routes_name.dart';


class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}


class _SuccessPageState extends State<SuccessPage> {
  String resetCodeSuccess="Votre code d'accès a été modifié avec succès. Vous pouvez vous connecter à nouveau.";
  String registerSuccess="Vous vous êtes inscrit avec succès dans notre  \n  application et vous pouvez commencer à l'utiliser.";
  String activeCompteSuccess="Votre compte a été activé avec succès! Vous pouvez vous connecter.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade300,

      body:  SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: AppDimensions.heightSize150,),
                // SvgPicture.asset('asset/images/success.svg', height: 75,),

                Image.asset(AppImages.SUCCESS_IMAGES,scale: 3,),

                SizedBox(height: AppDimensions.heightSize100,),

                const Text("Succès!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff000000),
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),

                SizedBox(height: AppDimensions.sizeboxHeight35,),

                Text(registerSuccess,
                   // isEnabledPage?activeCompteSuccess:isResetPage?resetCodeSuccess: registerSuccess,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )
                ),
         /* Align(
              heightFactor: 4.0,
              alignment: Alignment.bottomCenter,

              child:*/
                 Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainAppColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: const Size(double.infinity, 50), // Full width button
                        ),
                        child: const Text(
                          'Se connecter',
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                        ),

                      onPressed: () {
                        //isProfilPage? SignOut().signOut(context) :
                        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutesName.loginPage, (Route<dynamic> route) => false);

                        //Navigator.of(context, rootNavigator: true).pushNamed(AppRoutesName.login);
                      },

                    ),

                )
                //style: Theme.of(context).textTheme.headline4,
              ]),
        ),
      ),
    );
  }
}