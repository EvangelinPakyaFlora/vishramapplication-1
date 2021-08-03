import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vishramapp/Settings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vishramapp/Status.dart';
import 'package:vishramapp/home_screen.dart';
import 'package:image_cropper/image_cropper.dart';
void main() {
  SharedPreferences prefs;
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
    debugShowCheckedModeBanner: false,
    home: Editprofile(),
  ));
}

class Editprofile extends StatefulWidget {
  @override
  _EditprofileState  createState() => _EditprofileState();
}
Future<void> getValues() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String rawDecodedStorageJson= prefs.getString("user_details");
  Map<String,String> map1=jsonDecode(rawDecodedStorageJson);
  print("decoded Data in getvaluse ===> "+ map1.toString());
}
class _EditprofileState extends State<Editprofile> {final pinCodeController = TextEditingController();
final nameController = TextEditingController();
final dobController = TextEditingController();
final addressController = TextEditingController();
final emailController = TextEditingController();
final phoneNumberController = TextEditingController();
  String valueChooseState;
  String valueChooseCity;
  // String valueChoosePin;
  PickedFile _imageFile;
  //CroppedFile _croppedFile;
  final ImagePicker _picker = ImagePicker();
  final ImageCropper _cropper = ImageCropper();
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
  List<String> listItemCity = ["chennai", "cbe",
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
  // List<String> listItemPin = [
  //   "629002",
  //   "629003",
  //   "629003",
  // ];
  var map = new Map();
  // String get uid => null;
  @override
  void initState() {
    super.initState();
    getUserDetails();
  }
  void getUserDetails() {
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    print("uid"+firebaseUser.uid.toString());
   // print('updateUserData ===> '+ updateUserData.toString());
    FirebaseFirestore.instance.collection("UserDetails").where("uid", isEqualTo : firebaseUser.uid).get().then((
        querySnapshot) async {
      querySnapshot.docs.forEach((element) {});
      querySnapshot.docs[0].data();
      //print("uid"+firebaseUser);
      print(querySnapshot.docs[0].data().toString());
      nameController.text = querySnapshot.docs[0].data()["displayName"];
      dobController.text = querySnapshot.docs[0].data()["displayDob"];
      addressController.text = querySnapshot.docs[0].data()["displayAddress"];
      pinCodeController.text=querySnapshot.docs[0].data()["displayPin"];
     //valueChoosePin = querySnapshot.data()["displayPin"];
      emailController.text = querySnapshot.docs[0].data()["displayEmail"];
      phoneNumberController.text = querySnapshot.docs[0].data()["displayPhNum"];
      valueChooseState =querySnapshot.docs[0].data()["displayState"];
      valueChooseCity =querySnapshot.docs[0].data()["displayCity"];
      setState(() {
      });
      String rawJson = jsonEncode(map);
      // Setting data in local Storage
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("UserDetails", rawJson);
      // if (uid == "ubF4sTuUWKSX7tTmEGiZIOmA99A3") {
      //   Navigator.push(
      //       floraContext, MaterialPageRoute(builder: (context) => StatusInfo()));
      // } else {
      //   Navigator.push(
      //       floraContext, MaterialPageRoute(builder: (context) => Home1()));
      // }

      //getting Data from local Storage
      // final rawDecodedStorageJson= prefs.getString("user_details");
      // Map<String,dynamic> map1=jsonDecode(rawDecodedStorageJson);
      // print("decoded Data ===> "+ map1.toString());
    }
    );

  }

  @override
  Widget build(BuildContext context) {
   // getValues();
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SafeArea(
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.black,
                      backgroundImage: _imageFile ==null ?AssetImage("images/image.jpeg"):FileImage(File(_imageFile.path)),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.0,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(context: context,
                                  builder: (builder) => bottomSheet());
                            },
                            child: Icon(
                              Icons.edit_sharp,
                              size: 16.0,
                              color: Colors.tealAccent[700],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: 350,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(

                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent[700]),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Name',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.tealAccent[700],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.number,
                    controller:dobController,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent[700]),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                    labelText: 'D.O.B',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'DD/MM/YEAR',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.tealAccent[700],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: 350,
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent[700]),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                    labelText: 'Address line 1',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Address',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.library_books_outlined,
                      color: Colors.tealAccent[700],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent[700]),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                    labelText: 'Address line 2',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Address',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.library_books_outlined,
                      color: Colors.tealAccent[700],
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_city,
                    size: 25,
                    color: Colors.tealAccent[700],
                  ),
                  SizedBox(
                    width: 310,
                    child: DropdownButtonFormField(
                        hint: Text(
                          "City",
                        ),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        elevation: 16,
                        isExpanded: true,
                        style: TextStyle(color: Colors.black, fontSize: 15),
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
                        }).toList()),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(children: [
                Icon(
                  Icons.location_city,
                  size: 25,
                  color: Colors.tealAccent[700],
                ),
                SizedBox(
                  width: 140,
                  child: DropdownButtonFormField(
                      hint: Text(
                        "State",
                      ),

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
                Spacer(),
                SizedBox(
                  width: 150,
                  child: Container(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: pinCodeController,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent[700]),
                        ),
                        labelText: 'PinCode',
                        labelStyle: TextStyle(color: Colors.black),
                        //hintText: 'evangflora@gmail.com',
                        hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: Colors.tealAccent[700],
                        ),
                      ),
                    ),

                  ),
                ),

              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                width: 340,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent[700]),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    //hintText: 'evangflora@gmail.com',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.tealAccent[700],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                children: [
                  Container(
                    child: CountryCodePicker(
                        initialSelection: '+91',
                        favorite: ['+91', 'IN']
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1,
                    width: 0,
                    color: Colors.black,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Expanded(
                    child: TextField(
                      //keyboardType: TextInputType.number,
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent[700]),
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.black),
                        //hintText: 'Type Phone number',
                        hintStyle: TextStyle(
                            fontSize: 15.0, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 37,
                  width: 99,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            Settingspage()),
                      );
                    },
                    child: Container(
                      height: 20,
                      width: 70,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    color: Colors.grey,
                    textColor: Colors.white,

                  ),
                ),
                SizedBox(width: 50),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.tealAccent[700])),

                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      height: 20,
                      width: 50,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  color: Colors.tealAccent[700],
                  textColor: Colors.white,
                  onPressed: () {
                    updateData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settingspage()),
                    );
                  },
                ),
              ],
            ),
          ]),
        )
    );
  }
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: 200,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("assets/profile.jpeg")
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }
  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    // final croppedFile = await ImageCropper.cropImage(
    // aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    //   compressQuality: 100,
    //   maxHeight: 700,
    //   maxWidth: 700,
    //   compressFormat: ImageCompressFormat.jpg,
    //   androidUiSettings: AndroidUiSettings(
    //     toolbarColor: Colors.tealAccent,
    //     toolbarTitle: "Cropper",
    //     statusBarColor: Colors.tealAccent,
    //     backgroundColor: Colors.tealAccent,
    //   )
    // );
    setState(() {
      _imageFile = pickedFile;});
  }
  Future updateData() async {
    // this is the function that has to edit the username
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    return await FirebaseFirestore.instance.collection('UserDetails').doc(firebaseUser.uid).update({
      'displayName': nameController.text,
      'displayDob': dobController.text,
      'displayAddress': addressController.text,
      'displayPin': pinCodeController.text,
      'displayEmail': emailController.text,
      'displayPhNum': phoneNumberController.text,
      'displayState': valueChooseState,
      'displayCity': valueChooseCity,
    }
    );
  }
  // updateData(){
  //   CollectionReference collectionReference = FirebaseFirestore.instance.collection("UserDetails");
  //   var firebaseUser =  FirebaseAuth.instance.currentUser;
  //   FirebaseFirestore.instance.collection("UserDetails").where("uid", isEqualTo : firebaseUser.uid).get().then((
  //       querySnapshot) async {
  //     querySnapshot.docs.forEach((element) {});
  //     querySnapshot.docs[0].data();
  //     //print("uid"+firebaseUser);
  //     print(querySnapshot.docs[0].data().toString());
  //   nameController.text = querySnapshot.docs[0].data()["displayName"];
  //   dobController.text = querySnapshot.docs[0].data()["displayDob"];
  //   addressController.text = querySnapshot.docs[0].data()["displayAddress"];
  //   pinCodeController.text=querySnapshot.docs[0].data()["displayPin"];
  //   //valueChoosePin = querySnapshot.data()["displayPin"];
  //   emailController.text = querySnapshot.docs[0].data()["displayEmail"];
  //   phoneNumberController.text = querySnapshot.docs[0].data()["displayPhNum"];
  //   valueChooseState =querySnapshot.docs[0].data()["displayState"];
  //   valueChooseCity =querySnapshot.docs[0].data()["displayCity"];
  // }
  // }


// updateData(){
//   CollectionReference collectionReference = FirebaseFirestore.instance.collection("UserDetails"){
//     'diaplayName': nameController.text,
//   'diaplayDob': dobController.text,
//   'diaplayAddress': addressController.text,
//   'diaplayPin': pinCodeController.text,
//   'diaplayEmail': emailController.text,
//   'diaplayPhNum': phoneNumberController.text,
//   'diaplayState': valueChooseState,
//   'diaplayCity': valueChooseCity,
//   };
//   collectionReference.setData().whenComplete((){
//     print('created');
//   })
//
//   }
      }

