
import 'package:change_wallet/src/utils/consts/routes/app_routes_name.dart';
import 'package:flutter/material.dart';

import '../../../../utils/consts/app_specifications/allDirectories.dart';
import '../../../../utils/variable/global_variable.dart';
import '../../../widgets/numpad_keyboard.dart';




class AccessCodePage extends StatefulWidget {
  final String phoneController;
  final String nameController;

  const AccessCodePage({super.key, required this.phoneController, required this.nameController});

  @override
  State<AccessCodePage> createState() => _AccessCodePageState();
}

class _AccessCodePageState extends State<AccessCodePage> {
  final _accessCodeKey = GlobalKey<FormState>();
  bool _isRunning=false;
  final codeController = TextEditingController();
  final codeConfirmController = TextEditingController();

  late bool _passwordVisible;
  late bool _visibleKeyboard1 ;
  late bool _visibleKeyboard2 ;
  late bool _visibleConfirmCode;
  late bool _visibleButton;


  @override
  void initState() {
    _passwordVisible = false;
    _visibleKeyboard1=false;
    _visibleKeyboard2=false;
    _visibleConfirmCode=false;
    _visibleButton=false;
    super.initState();

  }

  @override
  void dispose() {
    codeController.dispose();
    codeConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      children: [
                        const Text(
                          'Création mot de passe',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 15),
                         Form(
                            key: _accessCodeKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[

                                const Text("Nouveau mot de passe",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xff000000),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
                                ),

                                _passwordField(
                                        controller:codeController,
                                        setVisibility: () {
                                          setState(() {
                                            _visibleKeyboard1 = true;
                                          });
                                        } ),


                                Visibility(
                                    visible:_visibleKeyboard1 ,
                                    child: _keyboardImplementation(
                                        controller:codeController,
                                        deleteAction:() {
                                          codeController.text = codeController.text
                                              .substring(0, codeController.text.length - 1);
                                        },
                                        onSubmitAction:() {
                                          setState(() {
                                            _visibleKeyboard1 = !_visibleKeyboard1;
                                            _visibleConfirmCode =true;
                                          });}
                                    )
                                ),

                                Visibility(
                                  visible: _visibleConfirmCode,
                                  child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[

                                          const Text("Confirmer votre mot de passe",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color(0xff000000),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              )
                                          ),
                                          SizedBox(height: AppDimensions.sizeboxHeight45,),

                                          SizedBox(
                                            height: 70,
                                            child: Center(
                                                child: _passwordField(
                                                    controller: codeConfirmController,
                                                    setVisibility:() {
                                                      setState(() {
                                                        _visibleKeyboard2 = true;
                                                      });
                                                    }
                                                )
                                            ),
                                          ),
                                        ]
                                    ),

                                ),

                                Visibility(
                                  visible:_visibleKeyboard2 ,
                                  child: Container(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: _keyboardImplementation(
                                        controller: codeConfirmController,
                                        deleteAction:() {
                                          codeConfirmController.text = codeConfirmController.text
                                              .substring(0, codeConfirmController.text.length - 1);
                                        },
                                        onSubmitAction:() {
                                          setState(() {
                                            _visibleKeyboard2 = !_visibleKeyboard2;
                                            _visibleConfirmCode =true;
                                            _visibleButton =true;
                                          });
                                        },
                                      )
                                  ),
                                ),

                                Visibility(
                                    visible: _visibleButton,
                                    child: _confirmRegistration()
                                ),
                              ],
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

  TextFormField _passwordField({
    required TextEditingController controller,
    required VoidCallback setVisibility,})
  {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 40),
      // Disable the default soft keybaord
      keyboardType: TextInputType.none,
      obscureText: _passwordVisible ,
      maxLength: 4,
      onTap: setVisibility,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty ) {
          return 'Veuillez remplir ce champs';
        }
        else if (value.length<4 ) {
          return 'Veuillez spécifier un code de 4 chiffres';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon:   IconButton(
          icon: Icon(
            _passwordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }

  NumPad _keyboardImplementation({
    required TextEditingController controller,
    required VoidCallback deleteAction,
    required VoidCallback onSubmitAction,
  }){
    return  NumPad(
        buttonSize: 75,
        buttonColor: Colors.white,
        // buttonColor: AppColors.mainBlueColor,
        iconColor: AppColors.mainAppColor,
        controller: controller,
        delete: deleteAction,
        // do something with the input numbers
        onSubmit: onSubmitAction
    );
  }

  Container _confirmRegistration(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0, AppDimensions.sizeboxHeight60, 0, 0),

      child: TextButton(
          onPressed:_isRunning ? null:  () async {
            setState(() {
              _isRunning=true;
            });
            if (_accessCodeKey.currentState!.validate()) {
              if (codeController.text != codeConfirmController.text) {
                globalResponseMessage.errorMessage(
                    "Les 2 codes ne sont pas identiques!!");
              }
              else {
                Navigator.of(context).pushNamed(AppRoutesName.successPage);
               /* isSignUpPage
                    ?
                signUpMethods.accessCodeCreationForSignUp(
                    context,
                    widget.phoneController,
                    widget.nameController,
                    widget.mailController,
                    widget.codePpmController,
                    codeController.text,
                    ApiUrl().signUpURLNew)
                    :
                ResetCodeAPI().accessCodeCreationForResetCode(
                    context, codeController.text, phoneNumber!);*/
              }
            }
            setState(() {
              _isRunning=false;
            });

          },

          style:ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(13.0)),
            backgroundColor: MaterialStateProperty.all(_isRunning?Colors.grey:AppColors.mainAppColor),
          ),

          child: const Text("Valider",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
              )
          )
      ),

    );
  }

}