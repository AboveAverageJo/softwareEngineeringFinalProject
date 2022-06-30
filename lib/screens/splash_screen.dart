import 'package:flutter/material.dart';
import 'dart:async';
import 'choose_device_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ChooseDeviceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4C748B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "HOMEBREW",
              style: TextStyle(
                fontFamily: 'norwester',
                fontSize: 48,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              "Great Coffee at Home",
              style: TextStyle(
                fontFamily: 'Kollektif',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
