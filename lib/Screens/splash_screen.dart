
import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home_screen/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 4),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage())
      );
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff87CEEB),
     body: Center(

       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Lottie.asset('assets/animations/splash.json', ),

           AnimatedTextKit(
             animatedTexts: [
               TypewriterAnimatedText("isTimeManagement",textStyle: TextStyle(
                 fontSize: 28,
                 color: Colors.white,
                 fontWeight: FontWeight.bold
               ), speed: Duration(milliseconds: 100))
             ],
           )
         ],
       ),
     ),
    );
  }
}
