import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_splashscreen/pages/home_page.dart';
import 'package:flutter_splashscreen/intro_screen.dart';
// import 'package:flutter_splashscreen/splashscreen.dart';
// import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
        ),
        useMaterial3: true,
      ),
      home: IntroScreen(),
      // home: HomePage(),
    );
  }
}
