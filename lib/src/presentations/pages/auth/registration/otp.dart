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
  final otp5Controller = TextEditingController();
  final otp6Controller = TextEditingController();
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
    otp5Controller.dispose();
    otp6Controller.dispose();
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
                          const SizedBox(height: 30),

                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              spacing: 12,
                             // mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                OTPFormField(controller: otp1Controller),

                                OTPFormField(controller: otp2Controller),

                                OTPFormField(controller: otp3Controller),

                                OTPFormField(controller: otp4Controller),
                                OTPFormField(controller: otp5Controller),

                                Container(
                                    width: AppDimensions.sizeboxWidth45,
                                    height: AppDimensions.sizeboxHeight45,
                                    margin:  EdgeInsets.fromLTRB(0, 1, 1, AppDimensions.sizeboxHeight20),

                                    decoration: BoxDecoration(
                                      color: otp6Controller.text.isCurrency?AppColors.lastOtpValueColor:Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(7),
                                    ),

                                    child: TextFormField(
                                        controller: otp4Controller,
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        onChanged: (value){
                                          setState(() {
                                            otpController.text = otp1Controller.text+otp2Controller.text+otp3Controller.text+otp4Controller.text+otp5Controller.text+otp6Controller.text;
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

                            const Text("Vous n'avez pas reçu de code?",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xff000000),
                                  //color: Color(0xffc64243),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,

                                )
                            ),

                            SizedBox(width: AppDimensions.sizeboxWidth10,),

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
                                    color: AppColors.mainAppColor,
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