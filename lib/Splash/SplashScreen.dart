import 'dart:async';
import 'package:flutter/material.dart';

import '../Auth/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
           builder: (BuildContext context) => LoginScreen())));
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //  width: 300,
        child: Image(
          image: AssetImage('assets/images/splash screen.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}