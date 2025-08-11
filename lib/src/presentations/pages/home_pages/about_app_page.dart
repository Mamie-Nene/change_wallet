

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
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(AppImages.APP_BACKGROUND,
                fit: BoxFit.cover,
                alignment: Alignment(-0.6, 0),
              ),
            ),
            // Slider d'images
            /*SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            width: double.infinity,
            child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
            setState(() {
            _currentPage = index;
            });
            },
            itemBuilder: (context, index) {
            return Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
            BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
            ),
            ],
            ),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
            images[index],
            fit: BoxFit.cover,
            width: double.infinity,
            ),
            ),
            );
            },
            ),
            ),*/
            // Gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.green.withOpacity(0.85),
                    ],
                  ),
                ),
              ),
            ),
            // Content
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /*Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(images.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index ? 12 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.orange
                                : Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.circle, size: 10, color: AppColors.mainAppColor),
                        SizedBox(width: 8),
                        Icon(Icons.circle, size: 10, color: Colors.white38),
                        SizedBox(width: 8),
                        Icon(Icons.circle, size: 10, color: Colors.white38),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Bienvenue sur',
                      style: TextStyle(
                          //fontWeight: FontWeight.w300,
                         // letterSpacing: 0.5,
                          color: Colors.white,
                          fontSize: 24
                      ),
                    ),
                     Text(
                      'Change Wallet',
                      style: TextStyle(
                        color: AppColors.mainAppColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                       // fontSize: 36,
                        //color: Colors.orange,
                       // letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 10),
                     Text(
                      'Plusieurs options d’échanage',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.mainAppColor,
                          fontSize: 12,
                        //fontSize: 18,
                        //fontWeight: FontWeight.w400,
                        //height: 1.4,
                        //letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Bénéficiez des meilleurs taux de change du marché.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        //fontSize: 18,
                        //fontWeight: FontWeight.w400,
                        //height: 1.4,
                        //letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 30),

                    ElevatedButton(
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
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            // Skip button
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      // Handle "Passer" button press
                      Navigator.of(context).pushNamed(AppRoutesName.loginPage);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child:  Text(
                      'Passer',
                      style: TextStyle(color: AppColors.mainAppColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}