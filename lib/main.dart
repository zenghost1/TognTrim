import 'dart:async';
import 'package:flutter/material.dart';
import 'package:togandtrimapp/pages/signupscreen.dart';

import 'landingpage/entiresplashscreen.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'GeneralSans',
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        initialRoute: '/',
        routes: appRoutes);
  }
}
