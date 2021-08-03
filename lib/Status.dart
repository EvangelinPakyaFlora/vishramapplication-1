import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: StatusInfo(),
  ));
}

class StatusInfo extends StatefulWidget {
  const StatusInfo({Key key}) : super(key: key);

  @override
  _StatusInfoState createState() => _StatusInfoState();
}

class _StatusInfoState extends State<StatusInfo> {
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
                "Status info",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        width: 400,
        height: 40,
        child: Row(
          children: [
            Icon(
              Icons.details_outlined,
              color: Colors.tealAccent[700],
            ),
            Text("Support Alert"),
          ],
        ),
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
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        padding: EdgeInsets.all(2.0),
      ),
      Container(
        width: 400,
        height: 40,
        child: Row(
          children: [
            Text("Ram Kamesh"),
            SizedBox(
              width: 150,
            ),
            FlatButton(
              onPressed: (){
                launch("tel://7639292332");
                makingPhoneCall();
              },
              child: Text(
                "-Tap to connect",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
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
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        padding: EdgeInsets.all(2.0),
      ),
      Container(
        width: 400,
        height: 40,
        child: Row(
          children: [
            Text("Tajesh Kumar"),
            SizedBox(
              width: 145,
            ),
            FlatButton(
              onPressed: (){
                launch("tel://9566093990");
                makingPhoneCall();
              },
              child: Text(
                "-Tap to connect",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
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
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        padding: EdgeInsets.all(2.0),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        width: 400,
        height: 40,
        child: Row(
          children: [
            Icon(Icons.contact_support, color: Colors.tealAccent[700]),
            Text("Sky Blue Pending"),
          ],
        ),
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
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        padding: EdgeInsets.all(2.0),
      ),
      Container(
        width: 400,
        height: 40,
        child: Row(
          children: [
            Text("Tiny Jacob"),
            SizedBox(
              width: 175,
            ),
          ],
        ),
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
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        padding: EdgeInsets.all(2.0),
      ),
      Container(
        width: 400,
        height: 40,
        child: Row(
          children: [
            Text("Ramesh Kumar"),
            SizedBox(
              width: 195,
            ),
          ],
        ),
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
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        padding: EdgeInsets.all(2.0),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        width: 400,
        height: 40,
        child: Row(
          children: [
            Icon(Icons.thumb_up, color: Colors.tealAccent[700]),
            Text("Sky Blue "),
          ],
        ),
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
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        padding: EdgeInsets.all(2.0),
      ),
      Container(
        width: 400,
        height: 40,
        child: Row(
          children: [
            Text("Naveen Kawal"),
            SizedBox(
              width: 180,
            ),
            Text(
              "-5:00 Pm",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
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
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        padding: EdgeInsets.all(2.0),
      ),
      Container(
        width: 400,
        height: 40,
        child: Row(
          children: [
            Text("Thomas Vargesh"),
            SizedBox(
              width: 160,
            ),
            Text(
              "-4:00 Pm",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
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
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        padding: EdgeInsets.all(2.0),
      ),
    ])));
  }

  makingPhoneCall() async {
    const url = '7639292332';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


