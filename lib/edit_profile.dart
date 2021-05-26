import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Editprofile(),
  ));
}

class Editprofile extends StatefulWidget {
  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  String valueChoose;
  List<String> listItem2 = ["chennai", "cbe",
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage("images/image.jpeg"),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12.0,
                      child: Icon(
                        Icons.edit_sharp,
                        size: 16.0,
                        color: Colors.tealAccent[700],
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
      Container(
          width: 350,
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.black),
              hintText: 'Dorra',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.tealAccent[700],
              ),
            ),
          ),
      ),
      SizedBox(
          height: 10,
      ),
      Container(
          width: 350,
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              labelText: 'D.O.B',
              labelStyle: TextStyle(color: Colors.black),
              hintText: '23/04/1986',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
              prefixIcon: Icon(
                Icons.calendar_today_outlined,
                color: Colors.tealAccent[700],
              ),
            ),
          ),
      ),
      SizedBox(
          height: 10,
      ),
      Container(
          width: 350,
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              labelText: 'Address line 1',
              labelStyle: TextStyle(color: Colors.black),
              hintText: 'No.25,3rd street,peter england opposite',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
              prefixIcon: Icon(
                Icons.library_books_outlined,
                color: Colors.tealAccent[700],
              ),
            ),
          ),
      ),
      SizedBox(
          height: 10,
      ),
      Container(
          width: 350,
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              labelText: 'Address line 2',
              labelStyle: TextStyle(color: Colors.black),
              hintText: 'National School,43-d Forjt,kk nagar',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
              prefixIcon: Icon(
                Icons.library_books_outlined,
                color: Colors.tealAccent[700],
              ),
            ),
          ),
      ),
      SizedBox(
          height: 0,
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.location_city,
              size: 25,
              color: Colors.tealAccent[700],
            ),
            SizedBox(
              width: 250,
              child: DropdownButtonFormField(
                  hint: Text(
                    "City",
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue;
                    });
                  },
                  items: listItem2.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList()),
            ),
          ],
      ),
      SizedBox(
          height: 0,
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            width: 300,
            child: Row(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_city,
                    size: 25,
                    color: Colors.tealAccent[700],
                  ),
                  SizedBox(
                    width: 100,
                    child: DropdownButtonFormField(
                        hint: Text(
                          "State",
                        ),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        value: valueChoose,
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue;
                          });
                        },
                        items: listItem2.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList()),
                  ),
                ],
              ),

              SizedBox(
                width: 150,

                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    child: DropdownButtonFormField(
                      icon: Icon(Icons.arrow_drop_down),

                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 7.0, horizontal: 1.0),

                        labelText: 'PinCode',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: '629602',
                        hintStyle:
                            TextStyle(fontSize: 10.0, color: Colors.black),
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: Colors.tealAccent[700],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.location_city,
                  size: 25,
                  color: Colors.tealAccent[700],
                ),
                SizedBox(
                  width: 250,
                  child: DropdownButton(
                      hint: Text(
                        "Tamil Nadu",
                      ),
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      value: valueChoose,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                        });
                      },
                      items: listItem2.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList()),
                ),
              ],
            ),*/
            ]),
          ),
      ),
      SizedBox(
          height: 10,
      ),
      Container(
          width: 340,
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.black),
              hintText: 'evangflora@gmail.com',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.tealAccent[700],
              ),
            ),
          ),
      ),
      SizedBox(
          height: 10,
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Container(
                child: CountryCodePicker(),
              ),
              VerticalDivider(
                thickness: 1,
                width: 1,
                color: Colors.black,
                indent: 15,
                endIndent: 15,
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Type Phone number',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
      ),
      /*Container(
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                  labelText: 'City',
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'chennai',
                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: Colors.greenAccent,
                  ),
                ),
              ),
            ),*/
      SizedBox(
          height: 60,
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  height: 20,
                  width: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              color: Colors.grey,
              textColor: Colors.white,
              onPressed: () {},
            ),
            SizedBox(width: 30),
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
                        fontSize: 10.0,
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
          ],
      ),
    ]),
        ));
  }
}
