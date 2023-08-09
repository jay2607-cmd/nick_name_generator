import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nick_name/views/home_screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(milliseconds: 1500),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                "assets/images/splash.png",
              ),
              height: 155,
              width: 155,
            ),
          ],
        ),
      ),
    );
  }
}
