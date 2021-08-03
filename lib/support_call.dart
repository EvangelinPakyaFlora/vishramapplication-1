import 'package:flutter/material.dart';
import 'package:vishramapp/home_screen.dart';


void main() {
  runApp(MaterialApp(
    home: Support(),
  ));
}
class Support extends StatefulWidget {
  const Support({Key key}) : super(key: key);

  @override
  _SupportState createState() => _SupportState();
}
class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
        height: 180,
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
              "Support Call",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Text(
          'Call Connecting...',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: CircleAvatar(
          radius: 60.0,
          backgroundColor: Colors.black,
          backgroundImage: AssetImage("images/image.jpeg"),
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 12.0,
              child: Icon(
                Icons.call,
                size: 16.0,
                color: Colors.tealAccent[700],
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Abram Danny',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
      ),
      Text('+91 8754793901'),

      SizedBox(
        height: 200,
        child: CircleAvatar(
          backgroundColor: Colors.red,
          radius: 30.0,
          child: IconButton(
            icon :Icon(Icons.call, size: 25.0,
              color: Colors.white,),
   onPressed: (){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Home1()),
  );
},
          ),
        ),
      ),
    ])));
  }
}
