import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'intro_page.dart';
import 'package:page_transition/page_transition.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), (){
      Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: IntroPage(),duration: Duration(seconds: 2)));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: 'logo',
            child: Center(
              child: Container(
                child: Image(
                  width: 300,
                  height: 250,
                  image: AssetImage("assets/images/logo3.png"),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
    width: 250.0,
    child: TypewriterAnimatedTextKit(
      isRepeatingAnimation: true,
      totalRepeatCount: 1,
      speed: Duration(milliseconds: 300),
    text: ["INiesta Vpn",], textStyle: GoogleFonts.bangers(fontSize: 50.0,letterSpacing: 10 ),
    textAlign: TextAlign.center,
    alignment: AlignmentDirectional.topStart // or Alignment.topLeft
    ),
    ),
        ],
      ),
    );
  }
}

