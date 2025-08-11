import 'dart:math';

class OTPgeneration{
  generateOTP(){
    int MAX = 10;
    var otpNum=[];
    for (var i = 0; i < 4; i++) {
      var number=Random().nextInt(MAX);
      print(number);
      otpNum.add(number);
    }
    print("OTP num generated");
    print(otpNum);
    return otpNum;
  }
}