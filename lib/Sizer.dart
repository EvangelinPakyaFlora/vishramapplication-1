import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(SizerWidget());
}

class SizerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          //theme: ThemeData.light(),
         // home: HomeScreen() ,
        );
      },
    );
  }
}