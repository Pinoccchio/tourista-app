import 'package:flutter/material.dart';
import 'package:flutter_app/pages/SignIn_Screen/sign_in_filled.dart';
import 'package:flutter_app/pages/splash.dart';
import 'package:flutter_app/pages/group_36133.dart';
import 'package:flutter_app/pages/group_36136.dart';
import 'package:flutter_app/pages/group_36137.dart';
import 'package:flutter_app/pages/group_36139.dart';
import 'package:flutter_app/pages/group_36140.dart';
import 'package:flutter_app/pages/group_36141.dart';
import 'package:flutter_app/pages/Home_Screen/home.dart';
import 'package:flutter_app/pages/profile.dart';
import 'package:flutter_app/pages/sign_out.dart';
import 'package:flutter_app/pages/study_planner_1.dart';
import 'package:flutter_app/pages/portable-doc-reader.dart';
import 'package:flutter_app/pages/transcriptions.dart';
import '../pages/Database_Helper/static_users.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String signInFilled = '/signInFilled';
  static const String group36133 = '/group36133';
  static const String group36136 = '/group36136';
  static const String group36137 = '/group36137';
  static const String group36139 = '/group36139';
  static const String group36140 = '/group36140';
  static const String group36141 = '/group36141';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String signOut = '/signOut';
  static const String studyPlanner = '/studyPlanner';
  static const String studyPlanner1 = '/studyPlanner1';
  static const String textToSpeech = '/textToSpeech';
  static const String transcriptions = '/transcriptions';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splashScreen: (context) => Splash(),
      signInFilled: (context) => SignInFilled(),
      group36133: (context) => Group36133(),
      group36136: (context) => Group36136(),
      group36137: (context) => Group36137(),
      group36139: (context) => Group36139(),
      group36140: (context) => Group36140(),
      group36141: (context) => Group36141(),

      /*
      home: (context) {
        final args = ModalRoute.of(context)?.settings.arguments as Map?;
        final user = args != null ? User(
          firstName: args['firstName'] ?? 'Guest',
          lastName: args['lastName'] ?? '',
          studentNumber: args['studentNumber'] ?? '',
          password: args['password'] ?? '',
          profilePictureUrl: args['profilePictureUrl'] ?? '', // Add this line
        ) : User(
          firstName: 'Guest',
          lastName: '',
          studentNumber: '',
          password: '',
          profilePictureUrl: '', // Add this line
        );

        return Home(
          studentNumber: user.studentNumber,
          firstName: user.firstName,
          lastName: user.lastName,
        );
      },

       */


      profile: (context) {
        final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

        final email = args?['email'] ?? '';

        return Profile(
          email: email,
        );
      },

      signOut: (context) => SignOut(),
      transcriptions: (context) => Transcriptions(),
    };
  }
}
