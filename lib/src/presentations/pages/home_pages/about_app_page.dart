

import 'package:flutter/material.dart';

import '/src/utils/consts/app_specifications/allDirectories.dart';
import '/src/utils/consts/routes/app_routes_name.dart';



class AboutAppPage extends StatefulWidget {
  const AboutAppPage({super.key});

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  final List<String> images = [
    'assets/images/background.png',
    'assets/images/background2.png',
    'assets/images/background3.png',
  ];
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(24),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutesName.loginPage);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainAppColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              /*   backgroundColor: Colors.orange,
                                      foregroundColor: Colors.white,
                                      elevation: 3,
                                      shadowColor: Colors.black.withOpacity(0.3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28),
                                    */
            ),
            child: const Text(
              'Commencer',
              style: TextStyle(
                color:Colors.white, // fontWeight: FontWeight.w600,
                // letterSpacing: 0.5,
              ),
            ),
          ) ,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.circle, size: 10, color: AppColors.mainAppColor),
                        SizedBox(width: 8),
                        Icon(Icons.circle, size: 10, color: Colors.grey.shade400),
                        SizedBox(width: 8),
                        Icon(Icons.circle, size: 10, color: Colors.grey.shade400),
                      ],
                    )
                ),
              ),
              const SizedBox(height: 100),
              Image.asset(AppImages.APP_BACKGROUND),
              const SizedBox(height: 50),
              Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Plusieurs options d’échanage',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.mainAppColor,
                          fontSize: 18,
                          //height: 1.4,
                          //letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        'Bénéficiez des meilleurs taux de change du marché.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 24,
                          //fontSize: 18,
                          //fontWeight: FontWeight.w400,
                          //height: 1.4,
                          //letterSpacing: 0.3,
                        ),
                      ),
                   ],
                  ),
                ),
            ],
          ),
        )
    );
  }
}