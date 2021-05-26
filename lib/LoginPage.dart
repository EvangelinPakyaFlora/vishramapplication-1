import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:vishramapp/createAccount.dart';


void main(){
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.tealAccent[700],
                  boxShadow: [
                    BoxShadow(color: Colors.grey),
                  ],
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 250.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Welcome",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign in to continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 2),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: CountryCodePicker(
                            initialSelection: "+91",
                            favorite: ["+91"],
                          ),
                        ),
                        VerticalDivider(
                          thickness: 0,
                          width: 0,
                          color: Colors.black,
                          indent: 15,
                          endIndent: 15,
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              // prefixIcon: CountryCodePicker(),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              // keyboardType: TextInputType.number,
                              //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Colors.greenAccent)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 25,
                  width: 140,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              color: Colors.tealAccent[700],
              textColor: Colors.white,
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Iam a new user,',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic),
                ),
                InkWell(
                  child: Text(
                    ' Sign Up',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.tealAccent[700],
                        fontStyle: FontStyle.italic),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Createaccount()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
