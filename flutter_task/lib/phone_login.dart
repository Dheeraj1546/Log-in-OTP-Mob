import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'otp.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);
  static String verify="";


  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController countrycode=TextEditingController();
  var phone="";
  @override
  void initState(){
    countrycode.text="+91";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Loginpage"),
      // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    // elevation: 0,
                    margin: EdgeInsets.all(2),
                    color: Colors.white,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                    ),
                    child: Image.network(
                      'https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1',
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                        'Please enter your mobile number and verify your OTP',
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                      )),
                ],
              ),
            ),
            SizedBox(height: 10,),

            Container(
                alignment: Alignment.centerLeft,
                padding:  EdgeInsets.all(10),
                child:  Text(
                  'Mobile Number',
                  style: TextStyle(fontSize: 15),
                )),
            Container(
              height: 70,
              padding:  EdgeInsets.all(10),
              child: TextField(
                onChanged: (value){
                  phone=value;
                },
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                obscureText: false,


                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),


                  ),
                  labelText: '+91 Enter Your Number',
                ),
              ),
            ),
            Container(
                width: width,
                height: 45,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(


                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                  onPressed: ()async{
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: "${countrycode.text+phone}",
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        loginPage.verify=verificationId;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyVerify()),
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );


                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const MyVerify()),
                    // );

                  },
                )
            ),


          ],
        )

    );
  }
}
