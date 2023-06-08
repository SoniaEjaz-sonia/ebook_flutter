import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../router.dart';
import '../../tabs/screens/tabs_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void startTimeout() {
    Timer(const Duration(seconds: 2), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  void changeScreen() async {
    MyRouter.pushPageReplacement(context, const TabsScreen());
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/app-icon.png',
              height: 300.0,
              width: 300.0,
            ),
          ],
        ),
      ),
    );
  }
}
