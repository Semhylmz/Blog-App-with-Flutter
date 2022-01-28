import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Config {
  static const String appName = "Ateizm Fikri";

  static SharedPreferences? sharedPreferences;

  //static FirebaseUser user;
  //static FirebaseAuth auth;
  static FirebaseFirestore? firestore;

  static String collectionUser = "users";
  static String userFavoritesList = 'userFavorites';

  static final String userName = 'name';
  static final String userEmail = 'email';
  static final String userUID = 'uid';
}
