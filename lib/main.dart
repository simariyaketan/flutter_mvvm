import 'package:flutter/material.dart';
import 'package:pra_task/resource/color.dart';
import 'package:pra_task/view/dashboard_screen.dart';

import 'resource/TxtStyle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => DashboardScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: color_E82925,
          child: Center(
            child: Text("Practical Task",style: BranGrotBold24ffffff,),
          ),
        ),
      ),
    );
  }
}
