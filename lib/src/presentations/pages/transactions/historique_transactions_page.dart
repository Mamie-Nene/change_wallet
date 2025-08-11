import '../../widgets/transactionAffichage.dart';
import '/src/utils/consts/routes/app_routes_name.dart';
import 'package:flutter/material.dart';

import '/src/utils/consts/app_specifications/allDirectories.dart';

class HistoriqueTransactionPage extends StatefulWidget {
  const HistoriqueTransactionPage({super.key});

  @override
  State<HistoriqueTransactionPage> createState() => _HistoriqueTransactionPageState();
}

class _HistoriqueTransactionPageState extends State<HistoriqueTransactionPage> {
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
    return Scaffold(
      backgroundColor: AppColors.mainAppColor,

      body: Column(
        children: [
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
                  'Historique Transactions',
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
                            hintText: 'Rechercher une transaction',
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
                    // Placeholder for market info
                    Container(
                      height: 150,
                      color: Colors.grey[200],
                      child: const Center(child: Text('Graphiques et données du marché')),
                    ),

                    afficheTransaction()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget afficheTransaction(){
      return
        Container(
          margin: EdgeInsets.only(bottom: AppDimensions.sizeboxHeight20),

          padding: EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth20, AppDimensions.sizeboxHeight10, AppDimensions.sizeboxWidth20, AppDimensions.sizeboxHeight10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Align(
                  alignment: Alignment.centerRight,
                  child:  Text("5 transactions",
                      style:TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )
                  )
              ),
              SizedBox(height:  AppDimensions.sizeboxHeight10,),

              SingleChildScrollView(
                child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                //reverse: true,
                itemCount:5,

                itemBuilder: (context, index){

                  return TransactionAffichage(
                    (){Navigator.of(context).pushNamed(AppRoutesName.detailTransaction);},
                      montant: 10000,
                        service:"User",
                        hour: "10:45",
                        date: "20 / 10 / 24"
                    );
                  },
                separatorBuilder: (BuildContext context, int index) { return Divider(thickness: 1);  },
              //   separatorBuilder: (BuildContext context, int index) { return SizedBox(height: AppDimensions.sizeboxHeight15,);  },
               ),
              ),
            ],
          )
        );


  }
}