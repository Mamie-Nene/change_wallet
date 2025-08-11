
import '../auth/profile_page.dart';
import '/src/utils/consts/app_specifications/allDirectories.dart';
import '/src/utils/consts/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import 'culture_recommandee_page.dart';
import 'dashboard_page.dart';

import '../transactions/historique_transactions_page.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      const DashboardPage(),
      const HistoriqueTransactionPage(),
      const CultureRecommandePage(),
      const ProfilePage(),

    ];

   return Scaffold(
      backgroundColor: AppColors.mainAppColor,

      body:pageList[_selectedIndex],

     bottomNavigationBar: Container(
       height: 80,
       child: Stack(
         children: [
           Positioned(
             bottom: 0,
             left: 0,
             right: 0,
             child: Container(
               height: 60,
               margin: const EdgeInsets.symmetric(horizontal: 0),
               decoration: const BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   IconButton(
                     icon: Column(
                       children: [
                         Icon(Icons.home, color: _selectedIndex == 0 ?AppColors.mainAppColor:Colors.grey),
                         Text('Accueil',style: TextStyle(color: _selectedIndex == 0 ?AppColors.mainAppColor:Colors.grey),)
                       ],
                     ),
                     onPressed: () => _onItemTapped(0),
                   ),
                   IconButton(
                     icon: Column(
                       children: [
                         Icon(Icons.store, color: _selectedIndex == 1 ?AppColors.mainAppColor:Colors.grey),
                         Text('Transactions',style: TextStyle(color: _selectedIndex == 1 ?AppColors.mainAppColor:Colors.grey))
                       ],
                     ),
                     onPressed: () => _onItemTapped(1),
                   ),
                   const SizedBox(width: 40), // spacer for FAB
                   IconButton(
                     icon: Column(
                       children: [
                         Icon(Icons.school, color: _selectedIndex == 2 ?AppColors.mainAppColor:Colors.grey),
                         Text('Historique',style: TextStyle(color: _selectedIndex == 2 ?AppColors.mainAppColor:Colors.grey))
                       ],
                     ),
                     onPressed: () => _onItemTapped(2),
                   ),
                   IconButton(
                     icon: Column(
                       children: [
                          Icon(Icons.person, color: _selectedIndex == 3 ?AppColors.mainAppColor:Colors.grey),
                         Text('Profil',style: TextStyle(color: _selectedIndex == 3 ?AppColors.mainAppColor:Colors.grey))
                       ],
                     ),
                     onPressed: () => _onItemTapped(3),
                   ),
                 ],
               ),
             ),
           ),
           Positioned(
             top: 0,
             left: MediaQuery.of(context).size.width / 2 - 28,
             child: FloatingActionButton(
               onPressed: () {
                 showModalBottomSheet(context: context, builder: (BuildContext context) {
                   return Container(
                     padding: const EdgeInsets.all(24.0),
                     height: 200, // Adjust height as needed
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget>[
                         Container(
                           width: 40,
                           height: 5,
                           decoration: BoxDecoration(
                             color: Colors.grey[300],
                             borderRadius: BorderRadius.circular(2.5),
                           ),
                           margin: const EdgeInsets.only(bottom: 16.0),
                         ),
                         ListTile(
                           leading: Icon(Icons.eco_outlined, color: AppColors.mainAppColor), // Placeholder icon
                           title: const Text('Faire une transaction'),
                           onTap: () {
                             // Handle Analyser le sol
                             Navigator.pop(context);
                           },
                         ),
                         ListTile(
                           leading: Icon(Icons.bug_report_outlined, color: AppColors.mainAppColor), // Placeholder icon
                           title: const Text('Recharger un compte'),
                           onTap: () {
                             // Handle Detecter une maladie
                             Navigator.pop(context);
                           },
                         ),
                       ],
                     ),
                   );
                 });
               },
               backgroundColor: Colors.white,
               child:  Icon(Icons.qr_code_scanner, color: AppColors.mainAppColor),
             ),
           ),
         ],
       ),
     ),


     // 2
    /* floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     floatingActionButton: FloatingActionButton(
       shape: const CircleBorder(),
       onPressed: () {},
       backgroundColor: Colors.green,
       child: const Icon(Icons.qr_code_scanner),
     ),
     bottomNavigationBar: BottomAppBar(
       shape: const CircularNotchedRectangle(),
       notchMargin: 10,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: const [
           IconButton(icon: Icon(Icons.home), onPressed: null),
           IconButton(icon: Icon(Icons.store), onPressed: null),
           SizedBox(width: 40), // Spacer for FAB
           IconButton(icon: Icon(Icons.school), onPressed: null),
           IconButton(icon: Icon(Icons.person), onPressed: null),
         ],
       ),
     ),*/

     //bon
     /* bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        onTap: (index) => _onItemTapped(index),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Marché',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grass_outlined),
            label: 'Cultures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(24.0),
              height: 200, // Adjust height as needed
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                    margin: const EdgeInsets.only(bottom: 16.0),
                  ),
                  ListTile(
                    leading: Icon(Icons.eco_outlined, color: Colors.green), // Placeholder icon
                    title: const Text('Analyser le sol'),
                    onTap: () {
                      // Handle Analyser le sol
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.bug_report_outlined, color: Colors.green), // Placeholder icon
                    title: const Text('Detecter une maladie'),
                    onTap: () {
                      // Handle Detecter une maladie
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          });
        },
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: const Icon(Icons.qr_code, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     */

    );
  }

} 