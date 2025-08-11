import '/src/utils/consts/routes/app_routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/src/utils/consts/app_specifications/allDirectories.dart';

class CultureRecommandePage extends StatelessWidget {
  const CultureRecommandePage({super.key});

  @override
  Widget build(BuildContext context) {
   // const Color(0xFF4CAF50),
    return Scaffold(
      backgroundColor: AppColors.mainAppColor,
     /* appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pushNamed(AppRoutesName.accueilPage) ,
        ),
        title: const Text(
          'Culture Recommandée',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),*/
      body:  Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pushNamed(AppRoutesName.accueilPage),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Culture Recommandée',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                     Text(
                      '📅 Calendrier de semance de légumes',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.mainAppColor),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Un guide précieux pour semer au bon moment et savourer des récoltes abondantes toute l’année dans un potager sain et équilibré.',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Légume', style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Mois de semis', style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                        rows: const [
                          DataRow(cells: [DataCell(Text('🍅 Tomate')), DataCell(Text('août – sept. – oct.'))]),
                          DataRow(cells: [DataCell(Text('🍆 Aubergine')), DataCell(Text('fév. – juil. – août – sept.'))]),
                          DataRow(cells: [DataCell(Text('🌶 Piment')), DataCell(Text('août – sept.'))]),
                          DataRow(cells: [DataCell(Text('🥒 Concombre')), DataCell(Text('fév. – mars – août – sept.'))]),
                          DataRow(cells: [DataCell(Text('🎃 Citrouille')), DataCell(Text('août'))]),
                          DataRow(cells: [DataCell(Text('🥒 Courgette')), DataCell(Text('fév. – mars – août – sept.'))]),
                          DataRow(cells: [DataCell(Text('🍉 Pastèque')), DataCell(Text('fév. – mars – août – sept.'))]),
                          DataRow(cells: [DataCell(Text('🍈 Melon')), DataCell(Text('fév. – mars – août – sept.'))]),
                          DataRow(cells: [DataCell(Text('🌽 Maïs')), DataCell(Text('fév. – mai'))]),
                          DataRow(cells: [DataCell(Text('🌿 Gombo')), DataCell(Text('fév. – mars – août'))]),
                          DataRow(cells: [DataCell(Text('🍓 Fraisier')), DataCell(Text('sept. – oct. – nov.'))]),
                          DataRow(cells: [DataCell(Text('🥔 Pomme de terre')), DataCell(Text('oct. – nov. – déc.'))]),
                          DataRow(cells: [DataCell(Text('🫘 Haricot')), DataCell(Text('sept. – oct.'))]),
                          DataRow(cells: [DataCell(Text('🌱 Haricots')), DataCell(Text('oct. – nov.'))]),
                          DataRow(cells: [DataCell(Text('🥬 Laitue')), DataCell(Text('fév. – mars – oct. – nov.'))]),
                          DataRow(cells: [DataCell(Text('🧅 Oignon')), DataCell(Text('sept. – oct. – nov.'))]),
                          DataRow(cells: [DataCell(Text('🧄 Ail')), DataCell(Text('oct. – nov.'))]),
                          DataRow(cells: [DataCell(Text('🌿 Mauve')), DataCell(Text('fév. – mars'))]),
                          DataRow(cells: [DataCell(Text('🌿 Persil')), DataCell(Text('oct. – nov. – déc. – janv.'))]),
                          DataRow(cells: [DataCell(Text('🌿 Coriandre')), DataCell(Text('fév. – mars – oct. – nov. – déc.'))]),
                          DataRow(cells: [DataCell(Text('🌿 Cresson')), DataCell(Text('sept. – oct. – nov.'))]),
                          DataRow(cells: [DataCell(Text('🌿 Aneth')), DataCell(Text('fév. – mars – oct. – nov.'))]),
                          DataRow(cells: [DataCell(Text('🌱 Épinards')), DataCell(Text('oct. – nov.'))]),
                          DataRow(cells: [DataCell(Text('🌿 Fenugrec')), DataCell(Text('nov. – déc.'))]),
                          DataRow(cells: [DataCell(Text('🥕 Carotte')), DataCell(Text('oct. – nov.'))]),
                          DataRow(cells: [DataCell(Text('🌿 Menthe')), DataCell(Text('janv. – fév. – mars – sept. – oct. – nov.'))]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

    );
  }

} 