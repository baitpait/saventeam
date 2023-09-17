import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:saventeam/screen/main_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView> {
  int _splashTimer = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_splashTimer == 1) {
        timer.cancel();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Mainscreen(),
            ));
      } else {
        setState(() {
          _splashTimer--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF556ee6),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image/logi.png",
              width: 200,
            ),
            const Text(
              "7team",
              style: TextStyle(color: Colors.white, fontSize: 32,fontWeight: FontWeight.bold),
            )
          ],
        )),
      ),
    );
  }
}
