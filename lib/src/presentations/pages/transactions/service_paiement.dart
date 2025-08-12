import 'package:flutter_svg/svg.dart';

import '../../widgets/transactionAffichage.dart';
import '/src/utils/consts/routes/app_routes_name.dart';
import 'package:flutter/material.dart';

import '/src/utils/consts/app_specifications/allDirectories.dart';

class ServicePaiementPage extends StatefulWidget {
  const ServicePaiementPage({super.key});

  @override
  State<ServicePaiementPage> createState() => _ServicePaiementPageState();
}

class _ServicePaiementPageState extends State<ServicePaiementPage> {
  final searchController = TextEditingController();


  int selection =0 ;
  void _changeSelection(int select) {
    setState(() {
      selection =select;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged(String text) {
    print('text on search $text');
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    List<String>titles = ['Transfert','Achats','Banques','Assurances','Investissements'];
    List<String> icons = ["transfert","shopping_card","bank","dots","assurances","invest"];
    List<MaterialColor> colors = [Colors.red, Colors.lightGreen, Colors.yellow, Colors.blue, Colors.brown];
    List<MaterialColor> backgroundColors =[Colors.red, Colors.lightGreen, Colors.yellow, Colors.blue,Colors.brown];

    return Scaffold(
      backgroundColor: AppColors.mainAppColor,

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 50.0, 24.0, 16.0),

            //padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
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
                  'Services de paiement',
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth20,0, AppDimensions.sizeboxWidth20, AppDimensions.sizeboxHeight10),
                      child: Container(
                        width: 373.9999999999999,
                        height: 42,
                        decoration:  const BoxDecoration(
                          color: Colors.white,
                        ),
                        child:TextField(
                          showCursor: true,
                          cursorColor: Colors.grey.shade800,
                          cursorWidth: 1,
                          controller: searchController,
                          decoration:  InputDecoration(
                            hintText: 'Rechercher ',
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                                color:Colors.black87
                            ),
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.mainAppColor,
                              ),
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color:  AppColors.mainAppColor
                                  // borderSide: BorderSide(color: Color(0xff9a9a9a)
                                )
                            ),
                          ),
                          onChanged: _onSearchTextChanged,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      height:MediaQuery.of(context).size.height/8 ,
                      width:MediaQuery.of(context).size.width ,

                      child: GridView.builder(
                        scrollDirection : Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: titles.length,
                        physics:BouncingScrollPhysics(),
                        itemBuilder: ( BuildContext context, int index) {
                          return  _buildMenuCard(
                            context,
                            titles[index],
                            icons[index],
                              (){ Navigator.of(context).pushNamed(AppRoutesName.accueilPage);},
                            colors[index],
                            backgroundColors[index].shade50,
                          );
                        },
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 10)
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildMenuCard(
      BuildContext context,
      String title,
      String icon,
      VoidCallback actions,
      Color color,
      Color backgroundColor) {
    return InkWell(
      onTap: actions,
      child:Column(
        children: [
          Card(
            elevation: 0,
            color: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
                padding: EdgeInsets.all(8.0),
                child: SvgPicture.asset("asset/images/$icon.svg", height: 30, color: color)
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
}