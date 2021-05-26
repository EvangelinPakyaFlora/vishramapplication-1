import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:vishramapp/home_screen.dart';



void main() {
  runApp(MaterialApp(
    home: Createaccount(),
  ));
}
enum MobileVerificationState{
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class Createaccount extends StatefulWidget {
  const Createaccount({Key key}) : super(key: key);

  @override
  _CreateaccountState createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  CountryCode countryCode;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  TextEditingController _controller= TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId;
  bool showLoading = false;
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async{
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
      await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });

      if(authCredential?.user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home1()));
      }
    }on FirebaseAuthException catch (e) {
    setState(() {
    showLoading = false;
    });
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
  getMobileFormWidget(context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.tealAccent[700],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    spreadRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 250.0))),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Create Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 310,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(9)),
            ),
            padding: EdgeInsets.all(2.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              autocorrect: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.tealAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 310,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(9)),
            ),
            padding: EdgeInsets.all(2.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              autocorrect: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.tealAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 310,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(9)),
            ),
            padding: EdgeInsets.all(2.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              autocorrect: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.note,
                  color: Colors.tealAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 310,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(9)),
            ),
            padding: EdgeInsets.all(2.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              autocorrect: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.location_city,
                  color: Colors.tealAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 310,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(9)),
            ),
            padding: EdgeInsets.all(2.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              autocorrect: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.location_city_sharp,
                  color: Colors.tealAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 310,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(9)),
            ),
            padding: EdgeInsets.all(2.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              autocorrect: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.location_on_outlined,
                  color: Colors.tealAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 310,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(9)),
            ),
            padding: EdgeInsets.all(2.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              autocorrect: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.tealAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: 300,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 4),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(9)),
            ),
            child: Row(
              children: [
                Container(

                  child: CountryCodePicker(onChanged: (code){
                    setState(() {
                      countryCode=code;
                    });

                    print(code);
                  },
                      initialSelection: '+91',
                      favorite: ['+91','IN']
                  ),
                ),
                VerticalDivider(
                  thickness: 1,
                  width: 1,
                  color: Colors.grey,
                  indent: 15,
                  endIndent: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: phoneController,

                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // prefixIcon: CountryCodePicker(),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
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
          SizedBox(
            height: 30.0,
          ),
          FlatButton(

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
               ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FlatButton(
                height: 10,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 350,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.tealAccent[700],

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),


                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize:15.0,color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    showLoading = true;
                  });

                  await _auth.verifyPhoneNumber(
                    phoneNumber: countryCode.toString()+phoneController.text,
                    verificationCompleted: (phoneAuthCredential) async {
                      setState(() {
                        showLoading = false;
                      });
                      //signInWithPhoneAuthCredential(phoneAuthCredential);
                    },
                    verificationFailed: (verificationFailed) async {
                      setState(() {
                        showLoading = false;
                      });
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text(verificationFailed.message)));
                    },
                    codeSent: (verificationId, resendingToken) async {
                      setState(() {
                        showLoading = false;
                        currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                        this.verificationId = verificationId;
                      });
                    },
                    codeAutoRetrievalTimeout: (verificationId) async {},
                  );
                },
                /*onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeO()),
                  );
                },*/
              ),
            ),
            color: Colors.tealAccent[700],
            textColor: Colors.white,

          ),
        ]),
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
              Text("Verification Code",
                style: TextStyle(
                  backgroundColor: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,


                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text("OTP has been send to you on your \nmobile number,please enter it below",
                style: TextStyle(
                  color: Colors.grey,
                  backgroundColor: Colors.white,
                  fontSize: 14,


                ),
              ),
              PinEntryTextField(
                fields: 6,
                onSubmit: (String pin){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Pin"),
                          content: Text('Pin entered is $pin'),
                        );
                      }
                  ); //end showDialog()

                }, // end onSubmit
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
                    onTap: () {

                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.tealAccent[700]
                ),
                child: FlatButton(
                  onPressed: ()async{
                    await _auth.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home1()));
                  },


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
          padding: const EdgeInsets.all(16),
        )
    );



  }


}

