import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Ateizm Fikri?',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontFamily: 'Muli',
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
