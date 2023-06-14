import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Lottie.asset('assets/bouncy-slime.zip'),
        // Image.asset('assets/Astrology with Tarot cards and crystal ball.png'),
        Text(
          "Welcome!",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Lottie.asset('assets/146441-bouncy-slime-animation.json'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/B.json'),
            Lottie.network(
                'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/E.json'),
            Lottie.network(
                'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
            Lottie.network(
                'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/R.json'),
          ],
        ),
      ],
    );
  }
}
