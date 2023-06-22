import 'package:flutter/material.dart';
import 'package:flutter_splashscreen/pages/movie_page.dart';
// import 'package:flutter_splashscreen/splashscreen.dart';
import 'pages/home_page.dart';
// import 'splashscreen.dart';

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
      // home: SplashScreen(),
      // home: HomePage(),
      home: MoviePage(),
    );
  }
}
