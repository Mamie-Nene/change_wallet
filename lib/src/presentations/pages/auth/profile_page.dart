import '/src/utils/consts/routes/app_routes_name.dart';

import 'package:flutter/material.dart';

import '../../../utils/consts/app_specifications/allDirectories.dart';
import 'edit_profile_page.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    List<String> titles= ['Notifications','Services de paiement','Historiques des transactions','Se déconnecter',];
    List<IconData> icons= [Icons.notifications_none,Icons.history,Icons.category_outlined,Icons.logout];
    List<MaterialColor> colors= [Colors.blue,Colors.blue,Colors.blue,Colors.red];
    List<VoidCallback> actions= [
      (){Navigator.of(context).pushNamed(AppRoutesName.notification);},
          (){Navigator.of(context).pushNamed(AppRoutesName.servicePaiement);},
          (){Navigator.of(context).pushNamed(AppRoutesName.historiqueTransaction);},
          () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent, // Make background transparent to show custom shape
              builder: (BuildContext context) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(24.0),
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
                      const Icon(
                        Icons.error_outline,
                        color: Colors.blue,
                        size: 60,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Êtes-vous sûr de vouloir vous déconnecter ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the bottom sheet
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.grey.shade100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                              ),
                              child: const Text(
                                'Annuler',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the bottom sheet
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginPage()),
                                      (Route<dynamic> route) => false,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.grey.shade100,
                                // backgroundColor: Colors.red.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                              ),
                              child: const Text(
                                'Oui, me déconnecter',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
    ];
    return Scaffold(
      backgroundColor: AppColors.mainAppColor,

      body: Column(
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
                  'Mon profil',
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
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.person, color: Colors.white, size: 40),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Gerald legrand',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Client',
                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon:  Icon(Icons.edit, color: AppColors.mainAppColor),
                              onPressed: () {
                                Navigator.of(context).pushNamed(AppRoutesName.editProfilPage);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Général',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height/2,
                          child: ListView.separated(
                            itemCount: titles.length,
                              separatorBuilder: (context,index){
                              return SizedBox(height: 20,);
                              },
                              itemBuilder: (context,index){
                                return InkWell(
                                  onTap: actions[index],
                                  child: Container(
                                    height: 60,
                                    padding: EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(13)
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(icons[index], color: colors[index]),
                                        SizedBox(width: 10,),
                                        Text(titles[index],style: TextStyle(fontSize: 16),),
                                      ],

                                    ),
                                  ),
                                );
                              }
                          ),
                        ),

                        // trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        // const Divider(height: 1, indent: 16, endIndent: 16),

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