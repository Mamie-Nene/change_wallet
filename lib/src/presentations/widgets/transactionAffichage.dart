
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '/src/utils/consts/app_specifications/allDirectories.dart';


class TransactionAffichage extends StatefulWidget {
  final double montant;
  final String service;
  VoidCallback action;
  final String date;
  final String hour;

  TransactionAffichage(this.action,{Key? key,required this.montant,required this.service,required this.hour, required this.date}) : super(key: key);

  @override
  State<TransactionAffichage> createState() => _TransactionAffichageState();
}

class _TransactionAffichageState extends State<TransactionAffichage> {

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.currency(
      locale: 'fr', // Use the appropriate locale for XOF
      symbol: 'FCFA',
      decimalDigits: 0,
    );

    return InkWell(
      onTap: widget.action,
      child:
         Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 45,
                    color: Colors.grey.shade200,
                  child: SvgPicture.asset("asset/images/money.svg",color: AppColors.mainAppColor,),
                ),
                // const SizedBox(width: 7,),
                Flexible(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [

                        const Text("De +221 771234567 ",
                            style: TextStyle(
                              //height: 1.4,
                              fontFamily: 'Roboto',
                              color: Color(0xff313131),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )
                        ),
                        const SizedBox(height: 7,),
                        Row(
                          children: [
                            Text( widget.date,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey.shade400,
                                  //color: Color(0xff313131),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )
                            ),
                            SizedBox(height:  AppDimensions.sizeboxWidth5,),

                            Text( widget.hour, //"01 nov 2019, 15h 45
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xff313131),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )
                            )
                          ],
                        ),

                      ]
                  ),
                ),

                Align(
                    alignment: Alignment.centerRight,
                    child:
                    Column(
                      children: [
                        Text("- ${formatter.format(widget.montant)}",
                            style:  TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.mainAppColor,
                              // color: AppColors.mainRedColor,
                              //color: faded-red,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )
                        ),
                         Row(
                            children: [
                              Image.asset("asset/images/wave.webp",scale: 9),
                              Icon(Icons.circle,size: 10,color: Colors.grey.shade100,),
                              Image.asset("asset/images/Yas.png",height: 20,),
                            ],
                        ),
                      ],
                    )
                ),
              ]
          ),
    );
  }
}