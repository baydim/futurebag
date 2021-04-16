import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futurebag/auth/kenal.dart';
import 'package:futurebag/auth/wrapauth.dart';
import 'package:futurebag/controller/connect.dart';
import 'package:futurebag/style/widgtall.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent, // status bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    Get.put(Connect());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      title: 'GandiniStore',
      theme: ThemeData(
        primaryColor: oren,
        indicatorColor: oren,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: oren,
        ),
        accentColor: oren,
        fontFamily: 'mb',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Wra(),
    );
  }
}

class Wra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData || snapshot.data != null) {
          return Bungkuskenal();
        }
        return Wrapauth();
      },
    );
  }
}
