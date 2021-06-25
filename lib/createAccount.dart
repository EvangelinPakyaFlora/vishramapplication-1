import 'package:country_code_picker/country_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:vishramapp/firebase_net.dart';
import 'package:vishramapp/home_screen.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    localizationsDelegates: [
      CountryLocalizations.delegate
    ],
    home: Createaccount(),
  ));
}

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class Createaccount extends StatefulWidget {
  const Createaccount({Key key}) : super(key: key);

  @override
  _CreateaccountState createState() => _CreateaccountState();
}
class _CreateaccountState extends State<Createaccount> {
  FirebaseAuth _auth;
  User _user;
  bool isLoading = true;
  String _name, _dob, _address, _state, _city, _pin, _email, _phone;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
  }
  final FirebaseAuth auth = FirebaseAuth.instance;
  String valueChoose;
  String valueChooseState;
  List<String> listItemCity = [
    "chennai",
    "cbe",
    "Ariyalur",
    "Chengalpattu",
    "Chennai",
    "Coimbatore",
    "Cuddalore",
    "Dharmapuri",
    "Dindigul",
    "Erode",
    "Kallakurichi",
    "Kanchipuram",
    "Kanyakumari",
    "Karur",
    "Krishnagiri",
    "Madurai",
    "Nagapattinam",
    "Namakkal",
    "Nilgiris",
    "Perambalur",
    "Pudukkottai",
    "Ramanathapuram",
    "Ranipet",
    "Salem",
    "Sivaganga",
    "Tenkasi",
    "Thanjavur",
    "Theni",
    "Thoothukudi (Tuticorin)",
    "Tiruchirappalli",
    "Tirunelveli",
    "Tirupathur",
    "Tiruppur",
    "Tiruvallur",
    "Tiruvannamalai",
    "Tiruvarur",
    "Vellore",
    "Viluppuram",
    "Virudhunagar"
  ];
  List<String> listItemState = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "UttaraKhand",
    "Uttar Pradesh",
    "West Bengal",
    "Andaman And Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli and Daman & Diu",
    "Jammu & Kashmir",
    "Ladakh",
    "Lakshadweep",
    "Puducherry",
    "The Govt of NCT of Delhi",
  ];
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  CountryCode countryCode;
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final dobController = TextEditingController();

  final otpController = TextEditingController();
  TextEditingController _controller = TextEditingController();
  String verificationId;
  bool showLoading = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _validate = false;
  String pinCode="";
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });



      if (authCredential?.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home1()));
        User updateUser = FirebaseAuth.instance.currentUser;
        updateUser.updateProfile(displayName: nameController.text,);
        //updateUser.updateProfile(displayAddress: addressController.text);
        userSetup(nameController.text,addressController.text,dobController.text);

      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }



String value;
//String _code;
  getMobileFormWidget(context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          autovalidate: _validate,
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Container(
              height: 150,
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                elevation: 18,
                shadowColor: Colors.black,
                child: TextFormField(
                  controller: nameController,
                  cursorHeight: 20,
                  maxLines: 1,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      labelText: "Name",
                      labelStyle: TextStyle(
                          color: Colors.black, fontStyle: FontStyle.normal),
                      hintText: "Name",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.tealAccent[700],
                      ),
                      fillColor: Colors.white,

                      filled: true,
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.tealAccent[700], width: 1))),
                  autovalidate: _validate,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black),

                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                  onSaved: (String name) {
                    _name = name;
                  },
                  autocorrect: true,
                 /*onChanged: (text){
                    value =text;
                 },*/
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                elevation: 18,
                shadowColor: Colors.black,
                child: TextFormField(
                  controller: dobController,
                  maxLines: 1,
                  cursorHeight: 20,

                  autovalidate: _validate,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please Enter dob";
                    }
                    return null;
                  },
                  onSaved: (String dob) {
                    _dob = dob;
                  },
                  style: TextStyle(color: Colors.black),
                  autocorrect: true,
                  decoration: InputDecoration(
                      enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(8.0),
                      hintText: "DD/MM/YEAR",
                      prefixIcon: Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.tealAccent[700],
                      ),
                      labelText: "D.O.B",
                      labelStyle: TextStyle(
                          color: Colors.black, fontStyle: FontStyle.normal),

                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.tealAccent[700], width: 1))),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                elevation: 18,
                shadowColor: Colors.black,
                child: TextFormField(
                  controller: addressController,
                  autovalidate: _validate,
                  style: TextStyle(color: Colors.black),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please Enter address";
                    }
                    return null;
                  },
                  onSaved: (String address) {
                    _address = address;
                  },
                  autocorrect: true,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    labelText: "Address",
                    labelStyle: TextStyle(
                        color: Colors.black, fontStyle: FontStyle.normal),
                    hintText: "Address",

                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.tealAccent[700], width: 1)),
                    contentPadding: EdgeInsets.all(8.0),
                    prefixIcon: Icon(
                      Icons.note,
                      color: Colors.tealAccent[700],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                elevation: 18,
                shadowColor: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 25,
                      color: Colors.tealAccent[700],
                    ),
                    SizedBox(
                      width: 280,
                      child: DropdownButtonFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Please Enter state";
                            }
                            return null;
                          },
                          onSaved: (String state) {
                            _state = state;
                          },
                          decoration: InputDecoration(
                            labelText: "State",
                              labelStyle: TextStyle(
                                  color: Colors.black, fontStyle: FontStyle.normal),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.tealAccent, width: 1)),
                              contentPadding: EdgeInsets.all(1),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,


                          style: TextStyle(color: Colors.black, fontSize: 15),
                          value: valueChooseState,
                          onChanged: (newValue) {
                            setState(() {
                              valueChooseState = newValue;
                            });
                          },
                          items: listItemState.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList()),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                elevation: 18,
                shadowColor: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 25,
                      color: Colors.tealAccent[700],
                    ),
                    SizedBox(
                      width: 280,
                      child: DropdownButtonFormField(
                          value: valueChoose,
                          onChanged: (newValue) {
                            setState(() {
                              valueChoose = newValue;
                            });
                          },
                          items: listItemCity.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Please Enter city";
                            }
                            return null;
                          },
                          onSaved: (String city) {
                            _city = city;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(1),
                              hintText: "TamilNadu",
                              labelText: "City",
                              labelStyle: TextStyle(
                                  color: Colors.black, fontStyle: FontStyle.normal),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.tealAccent, width: 1)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 18,
                  shadowColor: Colors.black,
                  child: TextFormField(
                    autovalidate: _validate,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter pin";
                      }
                      return null;
                    },
                    onSaved: (String pin) {
                      _pin = pin;
                    },
                    style: TextStyle(color: Colors.black),
                    autocorrect: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      hintText: "Pincode",
                      labelText: "Pincode",
                      labelStyle: TextStyle(
                          color: Colors.black, fontStyle: FontStyle.normal),
                      enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.tealAccent[700],
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.tealAccent[700], width: 1)),

                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                shadowColor: Colors.black,
                elevation: 18,
                child: TextFormField(
                  controller: _controller,
                  autovalidate: _validate,
                  validator: (String value) {
                    print("email");
                    if (_controller.text == null) {
                      return "Please Enter email";
                    }
                    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        .hasMatch(_controller.text)) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                  onSaved: (String email) {
                    _email = email;
                  },
                  style: TextStyle(color: Colors.black),
                  autocorrect: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.tealAccent[700], width: 1)),
                    contentPadding: EdgeInsets.all(8),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.tealAccent[700],
                    ),
                    hintText: "example@gmail.com",
labelText: "email",
                     labelStyle: TextStyle(
                      color: Colors.black, fontStyle: FontStyle.normal),
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide.none),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),

                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                shadowColor: Colors.black,
                elevation: 18,
                child: Row(
                  children: [
                    CountryCodePicker(
                        onChanged: (code) {
                          setState(() {
                            countryCode = code;
                          });

                          print(code);
                        },
                        initialSelection: '+91',
                        showCountryOnly: true,
                        showOnlyCountryWhenClosed: true,
                        favorite: ['+91', 'IN']
                    ),
                    VerticalDivider(
                      thickness: 1,
                      width: 1,
                      color: Colors.grey,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        autovalidate: _validate,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please Enter Phone number";
                          }
                          if (value.length < 9) {
                            return "Please enter valid phone number";
                          }

                          return null;
                        },
                        onSaved: (String phone) {
                          _phone = phone;
                        },
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          // prefixIcon: CountryCodePicker(),

                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.tealAccent[700], width: 1)),

                          contentPadding: const EdgeInsets.all(8.0),
                          filled: true,

                          hintStyle: TextStyle(
                            height: 2.5,
                          ),
                          fillColor: Colors.white,
                          enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
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
            ),
            SizedBox(
              height: 40.0,
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
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    // saveName();
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
                          //signInWithPhoneAuthCredential(phoneAuthCredential);
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
                    } else {
                      setState(() {
                        _validate = true;
                      });
                    }
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
                  //onPressed: () async {
                  //  await SmsAutoFill().listenForCode;
                 // },
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
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }
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
      ),
    );
  }

//   void saveName() {
// String name =_controller.text;
// saveNamedPreference(name).then((bool commited) => Navigator.push(
//     context, MaterialPageRoute(builder: (context) => Home1())));
//   }
}

// Future<bool> saveNamedPreference(String name)async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.setString("name",name);
//    return prefs.commit();
// }
// Future<String> getNamedPreference(String name)async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String name =prefs.getString("name");
//   return name;
// }