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
            child: Column(children: [
      Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.tealAccent[700],
            boxShadow: [
              BoxShadow(color: Colors.grey,
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
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Add Money To e-Wallet",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    child: Container(
                      width: 30,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: IconButton(
                          splashColor: Colors.black,
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                          tooltip: 'Choose',
                        ),
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
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(children: [
                  Container(
                    height: 45,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Request Statement",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    child: Container(
                      width: 30,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      child: IconButton(
                        splashColor: Colors.black,
                        icon: const Icon(
                          Icons.arrow_forward_ios,
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
            minWidth: 360,
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
                      padding: const EdgeInsets.only(right: 200),
                      child: Text(
                        '04 Oct 2020',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ),
                  Container(
                      color: Colors.tealAccent[700],
                      child: Icon(
                        Icons.filter_alt_outlined,
                        size: 28,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
              SizedBox(
                height: 10,
              ),
      Container(

        height: 300,
        width: 400,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.tealAccent[700],
                    child: Icon(Icons.approval,
                      color: Colors.white,
                    ),
                  ),
                  Text('Paid For Order To \n Medicines',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold)),
                  Text('-Rs. 267.0',style: TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.bold)),
                ],
              ),

              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.black),
                ),
              ),

            ),
            SizedBox(
              height: 70,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.tealAccent[700],
                    child: Icon(Icons.approval,
                    color: Colors.white,),
                  ),

                  Text('Paid For Order To \n to Cab Booking',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold)),
                  Text('-Rs. 850.0',style: TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.bold),),
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
              CircleAvatar(
                backgroundColor: Colors.tealAccent[700],
                child: Icon(Icons.approval,
                  color: Colors.white,),
              ),

              Text('Money Received from \n Aravind Kumar',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold)),
              Text('-Rs. 850.0',style: TextStyle(fontSize: 17,color: Colors.green,fontWeight: FontWeight.bold),),
            ],
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.transparent),
            ),
          ),
        ),

        ]

              ),

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
                      radius: 10,
                        backgroundColor: Colors.tealAccent[700],
                        child: Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.arrow_forward,color: Colors.white,)))
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
