
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
      const HistoriqueTransactionPage(),
     // const CultureRecommandePage(),
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
                         Icon(Icons.insert_chart, color: _selectedIndex == 1 ?AppColors.mainAppColor:Colors.grey),
                         Text('Transactions',style: TextStyle(color: _selectedIndex == 1 ?AppColors.mainAppColor:Colors.grey))
                       ],
                     ),
                     onPressed: () => _onItemTapped(1),
                   ),
                   const SizedBox(width: 40), // spacer for FAB
                   IconButton(
                     icon: Column(
                       children: [
                         Icon(Icons.history, color: _selectedIndex == 2 ?AppColors.mainAppColor:Colors.grey),
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

    );
  }

} 