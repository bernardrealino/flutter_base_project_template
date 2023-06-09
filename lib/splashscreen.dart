import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.yellow,
              ),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
            ),
          )
        ],
      ),
    );
  }
}
