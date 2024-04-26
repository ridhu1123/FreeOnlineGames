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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homescreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.network("https://marketplace.canva.com/EAFMLb3oZxM/1/0/1600w/canva-dark-blue-minimalist-game-with-skull-logo-n7QnmFDyYKs.jpg",height: 220,))
    );
  }
}