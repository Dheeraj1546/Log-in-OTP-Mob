import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/phone_login.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/cupertino.dart';

import 'api_datashow.dart';

class MyVerify extends StatefulWidget {
  const MyVerify({Key? key}) : super(key: key);

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  final FirebaseAuth auth=FirebaseAuth.instance;
  State<MyVerify> createState() => _MyVerifyState();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    final double width = MediaQuery.of(context).size.width;
    var code="";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "Verify your Mobile number",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your four Six OTP",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value){
                  code=value;
                },
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Resend OTP",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
              Container(
                  width: width,
                  height: 45,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Submit'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () async{
                      try{
                        PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId:loginPage.verify, smsCode: code);
                        await auth.signInWithCredential(credential);
                       // Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
                      }catch(e){
                        print("worng OTP");

                      } Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>JakesGit()),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:numeric_keyboard/numeric_keyboard.dart';
//
// import 'api_datashow.dart';
// class OtpPage extends StatefulWidget {
//   const OtpPage({Key? key}) : super(key: key);
//   @override
//   _OtpPageState createState() => _OtpPageState();
// }
//
// class _OtpPageState extends State<OtpPage> {
//   String text = '';
//
//   void _onKeyboardTap(String value) {
//     setState(() {
//       text = text + value;
//     });
//   }
//
//   Widget otpNumberWidget(int position) {
//     try {
//       return Container(
//         height: 40,
//         width: 40,
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.black, width: 0),
//             borderRadius: const BorderRadius.all(Radius.circular(8))),
//         child: Center(
//             child: Text(
//               text[position],
//               style: const TextStyle(color: Colors.black),
//             )),
//       );
//     } catch (e) {
//       return Container(
//         height: 40,
//         width: 40,
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.black, width: 0),
//             borderRadius: const BorderRadius.all(Radius.circular(8))),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: <Widget>[
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 20),
//                             child: const Text(
//                                 ' Verify your Mobile number',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.w500))
//                         ),
//                         Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 20),
//                             child: const Text(
//                                 ' Enter your four digit OTP',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Colors.black45,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400))
//                         ),
//                         Container(
//                           constraints: const BoxConstraints(maxWidth: 500),
//                           child:
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               otpNumberWidget(0),
//                               otpNumberWidget(1),
//                               otpNumberWidget(2),
//                               otpNumberWidget(3),
//                               // otpNumberWidget(4),
//                               // otpNumberWidget(5),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//
//                   ),
//                   SizedBox(height: 20,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // Text("Don't resive the OTP?", style: TextStyle(fontSize: 14, color: Colors.grey.shade500),),
//                       TextButton(
//                           onPressed: () {
//
//                           },
//                           child: Text( "Resend OTP", style: TextStyle(color: Colors.black),)
//                       )
//                     ],
//                   ),
//                   Container(
//                       width: width,
//                       height: 45,
//                       padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                       child: ElevatedButton(
//
//
//                         child: const Text('Submit'),
//                         style: ElevatedButton.styleFrom(
//                             primary: Colors.black12,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             )
//                         ),
//                         onPressed: () {
//
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => JakesGit()),
//                           );
//
//                         },
//                       )
//                   ),
//
//                   NumericKeyboard(
//                     onKeyboardTap: _onKeyboardTap,
//                     textColor: Colors.green,
//                     rightIcon: const Icon(
//                       Icons.backspace,
//                       color: Colors.green,
//                     ),
//                     rightButtonFn: () {
//                       setState(() {
//                         text = text.substring(0, text.length - 1);
//                       }
//                       );
//                     },
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
