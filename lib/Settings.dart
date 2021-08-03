import 'package:flutter/material.dart';
import 'package:vishramapp/edit_profile.dart';
import 'package:vishramapp/ewallet_page.dart';



void main() {
  runApp(MaterialApp(
    home: Settingspage(),
  ));
}

class Settingspage extends StatefulWidget {
  const Settingspage({Key key}) : super(key: key);

  @override
  _SettingspageState createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.tealAccent[700],
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 4),),

                ],
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 250.0))),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Settings ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 4),),

                            ],
                            color: Colors.tealAccent[700],
                            borderRadius: BorderRadius.circular(20)),
                        height: 55,
                        width: 55,
                        child: Icon(
                          Icons.person_pin,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 220,
                        child: FlatButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Editprofile()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Account",
                                style:
                                    TextStyle(fontSize: 25, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 4),),

                            ],
                            color: Colors.tealAccent[700],
                            borderRadius: BorderRadius.circular(20)),
                        height: 55,
                        width: 55,
                        child: Icon(
                          Icons.notification_important,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FlatButton(
                            child: Container(
                              height: 55,
                              width: 170,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Notifications",
                                    style:
                                        TextStyle(fontSize: 25, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 30,right: 30),
          //       child: Row(
          //         children: [
          //           Container(
          //             decoration: BoxDecoration(
          //                 boxShadow: [
          //                   BoxShadow(color: Colors.grey.withOpacity(0.5),
          //                     spreadRadius: 1,
          //                     blurRadius: 7,
          //                     offset: Offset(0, 4),),
          //
          //                 ],
          //                 color: Colors.tealAccent[700],
          //                 borderRadius: BorderRadius.circular(20)),
          //             height: 55,
          //             width: 55,
          //             child: Icon(
          //               Icons.account_balance_wallet_rounded,
          //               color: Colors.white,
          //               size: 40,
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 30.0, right: 30),
          //             child: Container(
          //               height: 50,
          //               width: 160,
          //               child: FlatButton(
          //                 onPressed: (){
          //                   Navigator.push(context, MaterialPageRoute(builder: (context)=> Ewallet()),
          //                   );
          //                 },
          //                 child: Align(
          //                   alignment: Alignment.centerLeft,
          //                   child: Text(
          //                     "e-Wallet",
          //                     style:
          //                     TextStyle(fontSize: 25, color: Colors.black,),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //
          //           ),Icon(
          //             Icons.arrow_forward_ios,
          //           ),
          //
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, 4),),

                          ],
                          color: Colors.tealAccent[700],
                          borderRadius: BorderRadius.circular(20)),
                      height: 55,
                      width: 55,
                      child: Icon(
                        Icons.help,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: FlatButton(
                        child: Container(
                          height: 55,
                          width: 170,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Help center",
                                style:
                                    TextStyle(fontSize: 25, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ],
                ),
              )
            ],
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Row(
                    children: [
                      Container(

                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 4),),

                            ],
                            color: Colors.tealAccent[700],
                            borderRadius: BorderRadius.circular(20)),
                        height: 55,
                        width: 55,
                        child: Icon(
                          Icons.info,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FlatButton(
                            child: Container(
                              height: 55,
                              width: 170,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "About us",
                                    style:
                                        TextStyle(fontSize: 25, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
