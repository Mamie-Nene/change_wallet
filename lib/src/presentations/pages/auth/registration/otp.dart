import 'dart:async';

import 'package:change_wallet/src/utils/consts/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../methods/otp_generation.dart';
import '../../../../utils/consts/app_specifications/allDirectories.dart';
import '../../../widgets/custom_textfield.dart';


class OtpVerificationPage extends StatefulWidget {
  final String phoneController;
  final String nameController;

  const OtpVerificationPage({Key? key, required this.phoneController, required this.nameController,}) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {

  late Timer _timer;
  int _start = 30;
  bool isLoading = false;

  final otp1Controller = TextEditingController();
  final otp2Controller = TextEditingController();
  final otp3Controller = TextEditingController();
  final otp4Controller = TextEditingController();
  final otpController =TextEditingController();

  OTPgeneration otp= OTPgeneration();

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isLoading = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
    //errorController = StreamController<ErrorAnimationType>();

  }

  @override
  void dispose() {

    otp1Controller.dispose();
    otp2Controller.dispose();
    otp3Controller.dispose();
    otp4Controller.dispose();
    otpController.dispose();

    super.dispose();
    _timer.cancel();
    // errorController!.close();
  }

  @override
  Widget build(BuildContext context) {
    bool focused = false;

    return Scaffold(
        backgroundColor: AppColors.mainAppColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous page
            },
          ),
        ),
        body:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          const Text(
                            'Vérification',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Renseigner le code OTP envoyé par sms svp.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              OTPFormField(controller: otp1Controller),

                              SizedBox(width: AppDimensions.sizeboxWidth17,),

                              OTPFormField(controller: otp2Controller),

                              SizedBox(width: AppDimensions.sizeboxWidth17,),

                              OTPFormField(controller: otp3Controller),

                              SizedBox(width: AppDimensions.sizeboxWidth17,),

                              Container(
                                  width: AppDimensions.sizeboxWidth50,
                                  height: AppDimensions.sizeboxHeight50,
                                  margin:  EdgeInsets.fromLTRB(0, 1, 1, AppDimensions.sizeboxHeight20),

                                  decoration: BoxDecoration(
                                    color: otp4Controller.text.isCurrency?AppColors.lastOtpValueColor:const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(7),
                                    boxShadow: const [BoxShadow(
                                        color: Color(0x7f000000),
                                        offset: Offset(0, 2),
                                        blurRadius: 4,
                                        spreadRadius: 0
                                    )
                                    ],
                                  ),

                                  child: TextFormField(
                                      controller: otp4Controller,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      onChanged: (value){
                                        setState(() {
                                          otpController.text = otp1Controller.text+otp2Controller.text+otp3Controller.text+otp4Controller.text;
                                          print(otpController.text);
                                        });
                                        if(value.length==1){
                                          Navigator.of(context).pushNamed(AppRoutesName.createPwdPage);
                                        // bon  OtpApi().otpVerification(context,otpController.text, widget.phoneController, widget.nameController ,widget.mailController, widget.codePpmController);
                                          // FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      onTap: (){setState(() {focused=!focused;});},
                                      onEditingComplete: (){setState(() {focused=!focused;});},
                                      inputFormatters: <TextInputFormatter>[ LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly],
                                      decoration:  InputDecoration(
                                        // fillColor: Color(0xff017368),
                                        //fillColor: focused? Color(0xffffffff):Color(0xff017368),
                                        //filled: true,
                                        border: InputBorder.none,
                                        labelStyle:  TextStyle(
                                          fontFamily: 'Roboto',
                                          color: focused? const Color(0xffffffff):const Color(0xff000000),
                                          //color: Color(0xff000000),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      )
                                  )

                              ),
                            ]
                        ),

                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutesName.createPwdPage);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainAppColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: const Size(double.infinity, 50), // Full width button
                            ),
                            child: const Text(
                              'Vérifier',
                              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        SizedBox(height:AppDimensions.sizeboxHeight17,),
                        _start != 0
                            ?
                        Row(
                          children: [
                           // const AppStyleText().appClickableTexts(text:'Renvoie du code dans : ',size: 14,color: AppColors.mainAppColor),

                            SizedBox(width:AppDimensions.sizeboxWidth10),

                            Text(
                                _start.toString(),
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,

                                )
                            ),
                          ],
                        )
                            :
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            const Text("Pas de code reçu?",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xff000000),
                                  //color: Color(0xffc64243),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,

                                )
                            ),

                            SizedBox(width: AppDimensions.sizeboxWidth30,),

                            InkWell(
                              onTap: () {
                               // registrationVar.otpNum= otp.generateOTP();
                                setState(() {
                                  _start = 5;
                                  isLoading = true;
                                  startTimer();
                                });
                              },

                              child: Text("Renvoyez le code",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: AppColors.mainRedColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: AppDimensions.sizeboxHeight50,),

                        // SizedBox(height: AppDimensions.sizeboxHeight50,),
                      ],
                                        ),
                    ),
                ),
                )
              ],
            )
    );
  }
}