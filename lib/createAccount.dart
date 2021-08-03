import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:vishramapp/Status.dart';
import 'package:vishramapp/firebase_net.dart';
import 'package:vishramapp/home_screen.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    supportedLocales: [
      Locale("af"),
      Locale("am"),
      Locale("ar"),
      Locale("az"),
      Locale("be"),
      Locale("bg"),
      Locale("bn"),
      Locale("bs"),
      Locale("ca"),
      Locale("cs"),
      Locale("da"),
      Locale("de"),
      Locale("el"),
      Locale("en"),
      Locale("es"),
      Locale("et"),
      Locale("fa"),
      Locale("fi"),
      Locale("fr"),
      Locale("gl"),
      Locale("ha"),
      Locale("he"),
      Locale("hi"),
      Locale("hr"),
      Locale("hu"),
      Locale("hy"),
      Locale("id"),
      Locale("is"),
      Locale("it"),
      Locale("ja"),
      Locale("ka"),
      Locale("kk"),
      Locale("km"),
      Locale("ko"),
      Locale("ku"),
      Locale("ky"),
      Locale("lt"),
      Locale("lv"),
      Locale("mk"),
      Locale("ml"),
      Locale("mn"),
      Locale("ms"),
      Locale("nb"),
      Locale("nl"),
      Locale("nn"),
      Locale("no"),
      Locale("pl"),
      Locale("ps"),
      Locale("pt"),
      Locale("ro"),
      Locale("ru"),
      Locale("sd"),
      Locale("sk"),
      Locale("sl"),
      Locale("so"),
      Locale("sq"),
      Locale("sr"),
      Locale("sv"),
      Locale("ta"),
      Locale("tg"),
      Locale("th"),
      Locale("tk"),
      Locale("tr"),
      Locale("tt"),
      Locale("uk"),
      Locale("ug"),
      Locale("ur"),
      Locale("uz"),
      Locale("vi"),
      Locale("zh")
    ],
    localizationsDelegates: [
      CountryLocalizations.delegate,
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
  CountryCode countryCode= CountryCode(dialCode: "+91");
  FirebaseAuth _auth;
  User _user;
  bool isLoading = true;
  //String signCode;
  String _name, _dob, _address, _state, _city, _pin, _email, _phone;

  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;

    //otpListener();
  }
  final FirebaseAuth auth = FirebaseAuth.instance;
  String valueChooseCity;
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
  //CountryCode countryCode;

  final stateController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final dobController = TextEditingController();
  final pinCodeController = TextEditingController();
  final otpController = TextEditingController();
  TextEditingController _controller = TextEditingController();
  String verificationId;
  bool showLoading = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _validate = false;
  String pinCode = "";

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
      var uid1 = authCredential.user.uid;
      if (authCredential?.user != null) {
        print("authCredential ====> " + authCredential.toString());
        //getUserDetails(uid1,context);

        if (uid1 == "ubF4sTuUWKSX7tTmEGiZIOmA99A3") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StatusInfo()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home1()));
        }
        User updateUser = FirebaseAuth.instance.currentUser;
    updateUser.updateProfile(displayName: nameController.text,);
    userSetup(
    nameController.text, dobController.text, addressController.text, pinCodeController.text,_controller.text, phoneController.text, valueChooseState,valueChooseCity,);
  }
} on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
  String value;
  getMobileFormWidget(context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          autovalidate: _validate,
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Container(
              height: 200,
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
                          MediaQuery
                              .of(context)
                              .size
                              .width, 250.0))),
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
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.10),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: nameController,
                  cursorHeight: 20,
                  maxLines: 1,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(8.0),
                      labelText: "Name",
                      labelStyle: TextStyle(
                          color: Colors.black, fontStyle: FontStyle.normal),
                      hintText: "Name",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.tealAccent[700],
                      ),
                      enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius
                          .circular(8.0)),
                        borderSide: BorderSide(color: Colors.blueGrey[50],
                            width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.tealAccent[700], width: 1))
                  ),
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
                ),
              ),
            ),
            // Icons.calendar_today_outlined,
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.10),
                    ),
                  ],
                ),
                child: TextFormField(
                  // inputFormatters: [
                  //   MultiMaskedTextInputFormatter(
                  //       masks: ['xx-xx-xxxx', 'xx-xx-xxxx'], separator: '/')
                  // ],
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
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(8.0),
                      labelText: "D.O.B",
                      labelStyle: TextStyle(
                          color: Colors.black, fontStyle: FontStyle.normal),
                      hintText: "DD/MM/YYYY",
                      prefixIcon: Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.tealAccent[700],
                      ),
                      enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius
                          .circular(8.0)),
                        borderSide: BorderSide(color: Colors.blueGrey[50],
                            width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.tealAccent[700], width: 1))
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.10),
                    ),
                  ],
                ),
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
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(8.0),
                      labelText: "Address",
                      labelStyle: TextStyle(
                          color: Colors.black, fontStyle: FontStyle.normal),
                      hintText: "Address",
                      prefixIcon: Icon(
                        Icons.note,
                        color: Colors.tealAccent[700],
                      ),
                      enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius
                          .circular(8.0)),
                        borderSide: BorderSide(color: Colors.blueGrey[50],
                            width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.tealAccent[700], width: 1))
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.10),
                    ),
                  ],
                ),
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
                        // controller: stateController,
                        value:valueChooseState,
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
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal),
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
                          // value: valueChooseState,
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
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.10),
                    ),
                  ],
                ),
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
                        value: valueChooseCity,
                        onChanged: (newValue) {
                          setState(() {
                            valueChooseCity = newValue;
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
                                color: Colors.black,
                                fontStyle: FontStyle.normal),
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
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.10),
                    ),
                  ],
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: pinCodeController,
                  autovalidate: _validate,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please Enter pin";
                    }
                    return null;
                  },
                  onSaved: (String pinvalue) {
                    _pin = pinvalue;
                  },
                  style: TextStyle(color: Colors.black),
                  autocorrect: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(8.0),
                      labelText: "Pincode",
                      labelStyle: TextStyle(
                          color: Colors.black, fontStyle: FontStyle.normal),
                      hintText: "Pincode",
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.tealAccent[700],
                      ),
                      enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius
                          .circular(8.0)),
                        borderSide: BorderSide(color: Colors.blueGrey[50],
                            width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.tealAccent[700], width: 1))
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.10),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _controller,
                  autovalidate: _validate,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    print("email");
                    if (_controller.text == null) {
                      return "Please Enter email";
                    }
                    if (!RegExp(
                        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
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
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(8.0),
                      labelText: "email",
                      labelStyle: TextStyle(
                          color: Colors.black, fontStyle: FontStyle.normal),
                      hintText: "email@gmail.com",
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.tealAccent[700],
                      ),
                      enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius
                          .circular(8.0)),
                        borderSide: BorderSide(color: Colors.blueGrey[50],
                            width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.tealAccent[700], width: 1))
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.10),
                    ),
                  ],
                ),
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
                    //getUserDetails("ubF4sTuUWKSX7tTmEGiZIOmA99A3",  context);
                   // await SmsAutoFill().listenForCode;
                    // saveName();
                   //getUserDetails;
                    //final signCode= await SmsAutoFill().getAppSignature;
                   // print(signCode);
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
                    } else {
                      setState(() {
                        _validate = true;
                      });
                    }
                  },
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
    listenOtp();
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
              // PinFieldAutoFill(
              //   codeLength: 6,
              //  onCodeChanged: (String pin) {
              //     setState(() {
              //       pinCode = pin;
              //    });
              //     },
              // ),
              PinEntryTextField(
                fields: 6,
                onSubmit: (String pin) {
                  setState(() {
                    pinCode = pin;
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
                        fontStyle: FontStyle.normal),
                  ),
                  InkWell(
                    child: Text(
                      'Resend otp',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.tealAccent[700],
                          fontStyle: FontStyle.normal),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.tealAccent[700],
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.10),
                    ),
                  ],
                ),
                child: FlatButton(
                  onPressed: () async {
                    print(verificationId);
                    print(pinCode);
                    PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: verificationId, smsCode: pinCode);


                    signInWithPhoneAuthCredential(phoneAuthCredential);
                  },
                  // onPressed: () async {
                  //  await SmsAutoFill().listenForCode;
                  // },
                  /*onPressed: () async {
                    await _auth.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home1()));
                  },*/
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(22.0),
                  // ),

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
    double size = MediaQuery
        .of(context)
        .size
        .height;
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
  void listenOtp() async{
    await SmsAutoFill().listenForCode;
  }
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
void getUserDetails(String uid,BuildContext Context) {
  //var firebaseUser = await FirebaseAuth.instance.currentUser();
  FirebaseFirestore.instance.collection("UserDetails").doc(uid).get().then((
      querySnapshot) async {
    querySnapshot.data();
    print("uid");
    print(querySnapshot.data().toString());
    String phoneNumber = querySnapshot.get("displayPhNum");
    String address = querySnapshot.get("displayAddress");
    String uid = querySnapshot.get("uid");
    String name = querySnapshot.get("displayName");
    String dob = querySnapshot.get("displayDob");
    String pin = querySnapshot.get("displayPin");
    String email = querySnapshot.get("displayEmail");

    var map = new Map();
    map['phoneNumber'] = phoneNumber;
    map['address'] = address;
    map['uid'] = uid;
    map['name'] = name;
    map['dob'] = dob;
    map['pin'] = pin;
    map['email'] = email;

    String rawJson = jsonEncode(map);
    // Setting data in local Storage
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_details", rawJson);

    if (uid == "ubF4sTuUWKSX7tTmEGiZIOmA99A3") {
      Navigator.push(
          Context, MaterialPageRoute(builder: (context) => StatusInfo()));
    } else {
      Navigator.push(
          Context, MaterialPageRoute(builder: (context) => Home1()));
    }

    //getting Data from local Storage
    // final rawDecodedStorageJson= prefs.getString("user_details");
    // Map<String,dynamic> map1=jsonDecode(rawDecodedStorageJson);
    // print("decoded Data ===> "+ map1.toString());

  }
  );
}
//print(phoneNumber);

// to validate date of birth
// formater(){
//   var now = new DateTime.now(); //or u can pass the input text like _textController.text
//   var formatter = new DateFormat('dd-MM-yyyy');
//   String formatted = formatter.format(now);
//   print(formatted);
// }