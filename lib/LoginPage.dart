import 'package:country_code_picker/country_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:vishramapp/cloudmessages/message.dart';
import 'package:vishramapp/createAccount.dart';
import 'package:vishramapp/firebase_net.dart';
import 'package:vishramapp/home_screen.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    localizationsDelegates: [
      CountryLocalizations.delegate
    ],
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}
class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
String textValue="";
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  FirebaseAuth _auth;

  User _user;
  bool isLoading = true;

  @override
  void initState() {
    firebaseMessaging.configure(
  onLaunch: (Map<String, dynamic>msg ){
print("onlaunch called");
  },
    onResume: (Map<String, dynamic>msg ){
  print("onresume called");
},
onMessage: (Map<String, dynamic>msg ){
  print("onmessage called");
}
);
firebaseMessaging.requestNotificationPermissions(
  const IosNotificationSettings(
    sound: true,
    alert:true,
    badge:true,
  )
);
firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings Settings) {
print("ios registered");
});
firebaseMessaging.getToken().then((token){
  print('token is $token');
  update(token);
});
// TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
  }
  update(String token){
    textValue =token;
    print(token);
    setState(( ) {

    });
  }
  final FirebaseAuth auth = FirebaseAuth.instance;


  Widget build(BuildContext context) {
    return Login();
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  CountryCode countryCode=CountryCode(dialCode: "+91");
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  TextEditingController _controller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String pinCode="";
  String verificationId;
String _phone;
  bool showLoading = false;
  String uid;
//bool authUser;
//var user;
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
   await setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
      await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });
      print(authCredential);

      if (authCredential.user != null) {
        uid = authCredential.toString();
        print('uid ${uid}');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home1()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.message)));
      //if(authUser.user != null)Navigator.push(context, MaterialPageRoute(builder: (context)=>Home1()));
    }
  }
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool autoValidate = false;


  final SmsAutoFill _autoFill = SmsAutoFill();
  getMobileFormWidget(context){
    return Scaffold(

      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
        //      Image.network("https://picsum.photos/250?image=9",height: 30,width: 30,),
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
                              onChanged: (code) {
                                setState(() {
                                  countryCode = code;
                                });

                                print(code);
                              },
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
                            child: TextFormField(
                              autovalidate: autoValidate,
                              validator: (String value) {
                                if (value.isEmpty)
                                  return "Please Enter Phone number";

                              else  if (value.length < 9 || value.length > 10)
                                  return "Please enter valid phone number";

                                return null;
                              },
                              onSaved: (String phone) {
                                phone = _phone;
                              },
                              controller: phoneController,

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
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    setState(() {
                      showLoading = true;
                    });

                    await _auth.verifyPhoneNumber(
                      phoneNumber:
                      countryCode.toString() + phoneController.text,
                      verificationCompleted: (phoneAuthCredential) async {
                        setState(() {
                          showLoading = false;
                        });
                        signInWithPhoneAuthCredential(phoneAuthCredential);
                      },
                      verificationFailed: (verificationFailed) async {
                        setState(() {
                          showLoading = false;
                        });
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text(verificationFailed.message)));
                      },
                      codeSent: (verificationId, resendingToken) async {
                        setState(() {
                          showLoading = false;
                          currentState =
                              MobileVerificationState.SHOW_OTP_FORM_STATE;
                          this.verificationId = verificationId;
                        });
                      },
                      codeAutoRetrievalTimeout: (verificationId) async {},
                    );
                  } //else {
                    //setState(() {
                      //autoValidate = true;
                    //});
                 // }
                },

              /*  onPressed: () {

                  Navigator.push(context,MaterialPageRoute(builder: (context) => Home1()),);

                },*/
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I am a new user,',
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
      ),
    );
  }
  getOtpFormWidget(context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 160,
              ),
              Icon(
                Icons.send_to_mobile,
                color: Colors.tealAccent[700],
                size: 150.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Verification Code",
                style: TextStyle(
                  backgroundColor: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "OTP has been send to you on your \nmobile number,please enter it below",
                style: TextStyle(
                  color: Colors.grey,
                  backgroundColor: Colors.white,
                  fontSize: 14,
                ),
              ),

              PinEntryTextField(
                fields: 6,
                onSubmit: (String pin) {
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         title: Text("Pin"),
                  //         content: Text('Pin entered is $pin'),
                  //       );
                  //     });
                  setState(() {
                    pinCode=pin;
                  });
                },

              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didnt get the OTP?',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic),
                  ),
                  InkWell(
                    child: Text(
                      ' Sign',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.tealAccent[700],
                          fontStyle: FontStyle.italic),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.tealAccent[700]),
                child: FlatButton(
                  onPressed: () async {
                    print(verificationId);
                    print(pinCode);
                    PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: verificationId, smsCode:pinCode);


                    signInWithPhoneAuthCredential(phoneAuthCredential);

                  },
                 /*onPressed: () async {
                    await _auth.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home1()));
                  },*/
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text("Verify &Proceed"),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  
  @override
void initState(){
    super.initState();
    _listenOtp();
  }

  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: showLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
            ? getMobileFormWidget(context)
            : getOtpFormWidget(context),
      ),
    );
  }
  void _listenOtp() async{
    await SmsAutoFill().listenForCode;
  }
}

