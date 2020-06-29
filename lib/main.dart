import 'dart:async';

import 'package:flutter/material.dart';
import 'package:microcosm/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Microcosm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.greenAccent[400],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: splashScreen(),
    );
  }
}

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image.asset(
          'assets/images/splash.png', width: 200.0, height: 200.0,
        ),
      )
    );
  }

  Future<Timer> loadData() async{
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> homePage()));
  }
}