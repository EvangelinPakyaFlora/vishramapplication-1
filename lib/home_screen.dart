import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vishramapp/Settings.dart';
import 'package:vishramapp/support_call.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home1(),
    );
  }
}

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final _auth = FirebaseAuth.instance;
  String uid;

  Future showdialog(BuildContext context, String message) async {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pop(true);
    });
    return showDialog(
      barrierDismissible: false,
      builder: (context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: new AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              width: 3,
              color: Colors.tealAccent[700],
            ),
          ),
          title: SizedBox(
              height: 250, width: 250, child: Center(child: new Text(message))),
          actions: [
            FlatButton(
                onPressed: () => Navigator.pop(context), child: new Text("ok"))
          ],
        ),
      ),
      context: context,
    );
  }

  CountDownController _controller = CountDownController();
  int _duration = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
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
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 250.0))),
            child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 70, horizontal: 40),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 50,
                        child: ClipOval(
                          child: Image.asset(
                            "images/image.jpeg",
                            fit: BoxFit.cover,
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ClipOval(
                      child: Material(
                        color: Colors.white,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: IconButton(
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.greenAccent,
                              size: 28,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Settingspage()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 90,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.yellowAccent[100],
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 150,
                width: 350,
                color: Colors.yellowAccent[100],
                child: CircleAvatar(
                  backgroundColor: Colors.yellowAccent[100],
                  radius: 10.0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.call,
                      color: Colors.transparent,
                    ),
                    onPressed: () {
                       launch("tel://7639292332");
                     // _makingPhoneCall();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Support()),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent[100],
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                splashColor: Colors.grey,
                child: FlatButton(
                  color: Colors.blueAccent[100],
                  onPressed: () {
                    print('i');
                    showdialog(context, "Hi Good Morning \n Have a Good Day");
                  },
                  child: Container(
                    height: 150,
                    width: 320,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*_makingPhoneCall() async {
  const url = '7639292332';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}*/
