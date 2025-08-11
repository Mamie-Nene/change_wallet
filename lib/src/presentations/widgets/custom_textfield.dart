
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/consts/app_specifications/allDirectories.dart';

class CustomFormTextFieldForUsername extends StatelessWidget {
  // final String labelText;
  final String placeholder;
  final TextEditingController controller;

  const CustomFormTextFieldForUsername( {super.key, required this.placeholder, required this.controller});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/20,
      decoration: ShapeDecoration(
        color: const Color(0xFFF4F6F9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),

      child: TextFormField(
        // textAlign : TextAlign.center,
          controller: controller,
          keyboardType: TextInputType.text,
          inputFormatters:[FilteringTextInputFormatter.deny(RegExp(r'\s'))] ,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez remplir ce champs';
            }
            return null;
          },
          decoration:   InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding:  const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              hintStyle:  const TextStyle(
                color: const Color(0xFFAFB7C7),
                fontSize: 14,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
              ),
              hintText: placeholder
          )
      ),
    );
  }
}

class CustomFormTextFieldForPassword extends StatelessWidget {

  final String placeholder;
  final TextEditingController controller;
  final bool passwordVisible;
  final Widget action;

  const CustomFormTextFieldForPassword( {super.key, required this.placeholder, required this.controller, required this.passwordVisible, required this.action});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height/20,
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFF4F6F9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: TextFormField(
        // textAlign : TextAlign.center,
          controller: controller,
          keyboardType: TextInputType.text,
          inputFormatters:[FilteringTextInputFormatter.deny(RegExp(r'\s'))] ,
          obscureText: !passwordVisible,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez remplir ce champs';
            }
            return null;
          },
          decoration:   InputDecoration(
              suffixIcon:  action,
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding:  EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              hintStyle:  const TextStyle(
                  color: const Color(0xFFAFB7C7),
                  fontSize: 14,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
              ),
              hintText : placeholder


          )
      ),
    );
  }
}

class CustomTextfieldForDate extends StatelessWidget {
  final TextEditingController dateController;
  final String textForBox;
  final String svgIcons;
  final VoidCallback? action;
  const CustomTextfieldForDate({Key? key, required this.dateController, required this.textForBox, required this.svgIcons,required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width/3,
      padding: EdgeInsets.only(top: 15,left: 10,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child:
      SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              //mainAxisSize: MainAxisSize.min,
              children: [
                Text(textForBox,
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 12,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                    readOnly: true,
                    controller: dateController,
                     style:const TextStyle(
                       fontSize: 15
                     ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez remplir ce champs';
                      }
                      return null;
                      },
                     decoration:  InputDecoration(

                       suffix:  SvgPicture.asset("asset/images/$svgIcons.svg",height: 11,),
                       border: OutlineInputBorder(borderSide: BorderSide.none),
                     ),
                    onTap: action
                  ),
              ],
            ),
          ),

      );
  }
}
class OTPFormField extends StatelessWidget {
  bool isLastField;
  Function? setstate;
  VoidCallback? verificationFunction;
  final TextEditingController controller;

  OTPFormField( {super.key, this.isLastField=false, this.setstate, this.verificationFunction,required this.controller,});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: AppDimensions.sizeboxWidth50,
        height: AppDimensions.sizeboxHeight50,
        margin: EdgeInsets.fromLTRB(0, 1, 1,AppDimensions.sizeboxHeight20),
        decoration: BoxDecoration(
          color: isLastField?controller.text.isCurrency?AppColors.lastOtpValueColor:Colors.white:Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: const [
            BoxShadow(
                color: Color(0x7f000000),
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0
            )
          ],
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          onChanged: (value){
            if(value.length==1){
            //la souris se positionne sur le champs suivant
            isLastField?verificationFunction:FocusScope.of(context).nextFocus();
            }
          },
          inputFormatters: <TextInputFormatter>[ LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
            decoration: const InputDecoration(
          labelStyle:  TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          border: InputBorder.none,
            )
        )
    );
  }
}

