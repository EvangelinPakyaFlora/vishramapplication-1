import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vishramapp/home_screen.dart';
import 'package:vishramapp/support_call.dart';
void main(){
  runApp(MaterialApp(
    home: Dialog(),
  ));
}
class Dialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                         stops: [0.1, 0.5,],
                          colors: [Colors.redAccent[700], Colors.redAccent]),
                    //color: Colors.redAccent[400],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 20,
                        blurRadius: 10,
                        offset: Offset(15.0, 15.0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40,),

                      Icon(Icons.warning_amber_outlined,size: 80,color: Colors.white,),
                      SizedBox(height: 10,),
                      Text("Need Help for Andrea",style: TextStyle(fontSize: 15,color: Colors.white),),
                      SizedBox(height: 50,),



                      Container(    // second container
                        alignment: Alignment.center,
                       padding: EdgeInsets.all(0),
                       decoration: BoxDecoration(color: Colors.white,

                       ),
                       height: 70,

                          child: InkWell(
                            onTap: (){},
                            child: RaisedButton(
                              color: Colors.redAccent,
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Support()),
                                );
                                _makingPhoneCall();
                              },
                                child: Text(
                                  "Connect",style: TextStyle(fontSize: 15,color: Colors.white),
                                ),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
_makingPhoneCall() async {
  const url = 'tel:8754793901';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}