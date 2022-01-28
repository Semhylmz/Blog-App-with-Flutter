import 'package:ateizm_fikri/config/config.dart';
import 'package:ateizm_fikri/config/theme_data.dart';
import 'package:ateizm_fikri/views/blog_page.dart';
import 'package:ateizm_fikri/views/home_page.dart';
import 'package:ateizm_fikri/views/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Config.sharedPreferences = await SharedPreferences.getInstance();
  Config.firestore = FirebaseFirestore.instance;

  await ThemeColorData().createSharedPrefObject();
  runApp(
    ChangeNotifierProvider<ThemeColorData>(
      create: (BuildContext context) => ThemeColorData(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeColorData>(context, listen: false).loadTheme();
    ThemeData themeColor = Provider.of<ThemeColorData>(context).themeColor;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeColor,
      home: HomePage(),
    );
  }
}
