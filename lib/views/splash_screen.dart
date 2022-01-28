import 'dart:async';

import 'package:ateizm_fikri/views/home_page.dart';
import 'package:ateizm_fikri/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    displaySplash();
  }

  void displaySplash() {
    Timer(Duration(seconds: 3), () {
      Route route = MaterialPageRoute(builder: (_) => HomePage());
      Navigator.pushReplacement(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F2944),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 2),
            Image.asset('assets/images/logo.png'),
            Spacer(flex: 3),
            ColorLoader(
              dotOneColor: Colors.white,
              dotTwoColor: Colors.white,
              dotThreeColor: Colors.white,
            ),
            Padding(padding: EdgeInsets.only(bottom: 20))
          ],
        ),
      ),
    );

    return Container(
      child: Container(
        color: Color(0xFF0F2944),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              ColorLoader(
                dotOneColor: Colors.white,
                dotTwoColor: Colors.white,
                dotThreeColor: Colors.white,
              ),
              Padding(padding: EdgeInsets.only(bottom: 20))
            ],
          ),
        ),
      ),
    );
  }
}
