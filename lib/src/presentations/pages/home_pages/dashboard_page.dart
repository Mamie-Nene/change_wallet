import '../../../utils/consts/routes/app_routes_name.dart';
import '/src/utils/consts/app_specifications/allDirectories.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePicture() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      print('Image captured: ${photo.path}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image captured: ${photo.path}')),
      );
      Navigator.pop(context); // Ferme le bottom sheet
      Future.delayed(Duration.zero, () {
        //Navigator.of(context).pushNamed(AppRoutesName.soilAnalysisPage);

      });
    } else {
      Navigator.pop(context); // Ferme le bottom sheet même si annulé
    }
  }

  Future<void> _uploadImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print('Image selected: ${image.path}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image selected: ${image.path}')),
      );
      Navigator.pop(context); // Ferme le bottom sheet
      Future.delayed(Duration.zero, () {
       // Navigator.of(context).pushNamed(AppRoutesName.soilAnalysisPage);

      });
    } else {
      Navigator.pop(context); // Ferme le bottom sheet même si annulé
    }
  }


  @override
  Widget build(BuildContext context) {
    List<String>titles = ['Transfert','Achats','Banques','Voir plus'];
    List<IconData> icons = [Icons.transfer_within_a_station, Icons.shopping_cart, Icons.food_bank, Icons.school_outlined];
    List<VoidCallback> actions = [
      (){bottomSheetForAnalyserSol(context);},
          (){},
          (){bottomSheetForDetectionMaladie(context); },
          (){},
    ];

    return Scaffold(
      backgroundColor: AppColors.mainAppColor,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(

            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              _profilHeader(),

              const SizedBox(height: 15),

              // Content Grid
              Container(
                height: MediaQuery.of(context).size.height/1.2,
                  padding: const EdgeInsets.all(24.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Container(
                          height:MediaQuery.of(context).size.height/8 ,
                          width:MediaQuery.of(context).size.width ,

                          child: ListView.builder(
                             scrollDirection : Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: titles.length,
                            physics:BouncingScrollPhysics(),
                            itemBuilder: ( BuildContext context, int index) {
                              return  _buildMenuCard(context, titles[index], icons[index],actions[index]);
                            },
                          ),
                        ),

                        Divider(),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.transfer_within_a_station, size: 30, color: Colors.redAccent)
                            ),
                            Text("De")
                          ],
                        ),
                        Text("Opérateur"),
                        const SizedBox(height: 15),
                        Container(
                          height: 60,
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(13)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.shopping_cart, color:Colors.blue),
                              SizedBox(width: 10,),
                              Text("Wave money",style: TextStyle(fontSize: 16),),
                            ],

                          ),
                        ),
                        const SizedBox(height: 15),
                        Text("Numéro Téléphone"),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                children: [
                                  Text('🇸🇳 +221', style: TextStyle(fontSize: 16)),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: 'Ex: 77 000 00 00',
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.transfer_within_a_station, size: 30, color: Colors.green)
                            ),
                            Text("Vers")
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text("Opérateur"),
                        const SizedBox(height: 15),
                        Container(
                          height: 60,
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(13)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.shopping_cart, color:Colors.blue),
                              SizedBox(width: 10,),
                              Text("Wave money",style: TextStyle(fontSize: 16),),
                            ],

                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                children: [
                                  Text('🇸🇳 +221', style: TextStyle(fontSize: 16)),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: 'Ex: 77 000 00 00',
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutesName.accueilPage);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainAppColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: const Size(double.infinity, 50), // Full width button
                          ),
                          child: const Text(
                            'Connexion',
                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildWeatherIcon() {
    return SizedBox(
      width: 100,
      height: 80,
      child: Stack(
        children: [
          // Sun - positioned to be partially cut off at the top-right
          Positioned(
            top: 1,
            right: 40,
            child: Container(
              width: 30,
              height: 30,
              decoration: const ShapeDecoration(
                color: Color(0xFFFFC107),
                shape: OvalBorder(),
              ),
            ),
          ),


          // Main cloud
          Positioned(
            top: 11,
            right: 2,
            child: Container(
              width: 60,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
               // color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),

          // Cloud bumps for realistic cloud shape
          Positioned(
            top: 2,
            right: 15,
            child: Container(
              width: 33,
              height: 33,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
              //  color: Colors.white.withOpacity(0.95),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 8,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                //color: Colors.white.withOpacity(0.95),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Rain drops - positioned below the cloud
          Positioned(
            top: 50,
            right: 26,
            child: _buildRainDrop(), //2ieme
          ),
          Positioned(
            top: 46,
            right: 18,
            child: _buildRainDrop(), //3iem
          ),
          Positioned(
            top: 50,
            right: 12,
            child: _buildRainDrop(),//4iem
          ),
          Positioned(
            top: 46,
            right: 35,
            child: _buildRainDrop(), //1er
          ),
        ],
      ),
    );
  }
  Widget _buildRainDrop() {
    return Container(
      width: 4,
      height: 15,
      decoration: BoxDecoration(
        color: const Color(0xFF2196F3),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
  Widget _profilHeader(){
    return  Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 50.0, 24.0, 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                 CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: AppColors.mainAppColor, size: 30),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Gerald legrand',
                      style: TextStyle(fontSize: 14, color: Colors.white,),
                    ),
                    Text(
                      '+221 78 000 00 00',
                      style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                icon: const Icon(Icons.notifications_active,color: Colors.white,),
                onPressed: () {
                  // Handle notification button press
                },
            ),
          ],
        ),
      );
  }
  Widget _buildDashboardCard(BuildContext context, String title, IconData icon,VoidCallback actions ) {
    return Card(
      elevation: 0,
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: actions,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: ShapeDecoration(
                  shape: OvalBorder(),
                  color:Colors.white,
              ),
                child: Icon(icon, size: 30, color: Colors.green)),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildMenuCard(BuildContext context, String title, IconData icon,VoidCallback actions ) {
    return InkWell(
      onTap: actions,
      child:Column(
        children: [
          Card(
            elevation: 0,
            color: Colors.grey[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
                padding: EdgeInsets.all(8.0),
                child: Icon(icon, size: 30, color: Colors.blue)
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void bottomSheetForAnalyserSol(BuildContext context){
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
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
                    leading: Icon(Icons.camera_alt_outlined, color: Colors.green), // Placeholder icon
                    title: const Text('Prendre une images'),
                    onTap: _takePicture,
                  ),
                  ListTile(
                    leading: Icon(Icons.upload_file, color: Colors.green), // Placeholder icon
                    title: const Text('Televerser une image'),
                    onTap: _uploadImage,
                  ),
                ],
              ),
          );
        }
      );

  }

  void bottomSheetForDetectionMaladie(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
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
                  ),
                  margin: const EdgeInsets.only(bottom: 16.0),
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt_outlined, color: Colors.green), // Placeholder icon
                  title: const Text('Prendre une images'),
                  onTap: _takePicture,
                ),
                ListTile(
                  leading: Icon(Icons.upload_file, color: Colors.green), // Placeholder icon
                  title: const Text('Televerser une image'),
                  onTap: _uploadImage,
                ),
              ],
            ),
          );
        }
    );
  }
}

// Custom Clipper for top wave shape
class WeatherCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(size.width * 0.25, size.height, size.width * 0.5, size.height - 10);
    path.quadraticBezierTo(size.width * 0.75, size.height - 20, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Start from top-left
    path.moveTo(0, 0);//20
    path.quadraticBezierTo(size.width / 2, 20, 400, 50); // one downward wave //40
  //  path.quadraticBezierTo(size.width / 2, 0, size.width, 20); // one downward wave
     path.lineTo(300,300); // down right side
    //path.lineTo(size.width, size.height); // down right side
    path.lineTo(0, size.height); // bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
