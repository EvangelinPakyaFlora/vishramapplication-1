import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Ewallet(),
  ));
}

class Ewallet extends StatefulWidget {
  const Ewallet({Key key}) : super(key: key);

  @override
  _EwalletState createState() => _EwalletState();
}

class _EwalletState extends State<Ewallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      "e-Wallet",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "e-Wallet Balance",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Rs. 15,456.25",
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        Container(
                          height: 45,
                          width: 310,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Add Money To e-Wallet",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                            child: IconButton(
                              iconSize: 17,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                              tooltip: 'Choose',
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        Container(
                          height: 45,
                          width: 310,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Request Statement",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                            child: IconButton(
                              iconSize: 17,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                              tooltip: 'Choose',
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ButtonTheme(
                  minWidth: 0,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.tealAccent,
                    textColor: Colors.black,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 233),
                              child: Text(
                                '04 Oct 2020',
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.tealAccent[700],
                            ),
                            child: Icon(Icons.filter_alt_outlined,
                                size: 20, color: Colors.black),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(color: Colors.grey[200], boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                )
              ]),
              child: Column(children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.tealAccent[700],
                          child: Icon(
                            Icons.approval,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text('Paid For Order To \n Medicines',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text('-Rs. 267.0',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.red,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        child: CircleAvatar(
                          backgroundColor: Colors.tealAccent[700],
                          child: Icon(
                            Icons.approval,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text('Paid For Order To \n to Cab Booking',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text(
                        '-Rs. 850.0',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.tealAccent[700],
                          child: Icon(
                            Icons.approval,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text('Money Received from \n Aravind Kumar',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text(
                        '-Rs. 850.0',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.transparent),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("View All"),
                  ),
                  CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.tealAccent[700],
                      child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 1),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          )))
                ],
              ),
            )
          ],
        ),
      ),

      /*Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(children: [
                Container(
                  height: 80,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.black),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Add Money To e-Wallet",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                )
              ]),
            ),
          )),
      Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(children: [
                Container(
                  height: 80,
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.black),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Add Money To e-Wallet",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                )
              ]),
            ),
          ))*/
    );
  }
}
