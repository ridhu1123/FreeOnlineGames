import 'dart:async';

import 'package:flutter/material.dart';
import 'package:playgames/screens/homescreen.dart';
import 'package:playgames/screens/startscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    
    Timer(Duration(seconds: 3), () { 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StartScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network("https://img.freepik.com/free-photo/3d-character-emerging-from-smartphone_23-2151336630.jpg?t=st=1714029802~exp=1714033402~hmac=f73b4be3ad18b6243d63aefc9a82ef859814ddde738853b0cc30f048d4d67271&w=360",fit: BoxFit.fill,)
    );
  }
}