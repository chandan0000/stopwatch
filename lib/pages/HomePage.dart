import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stopwatch stopwatch;
  late Timer t;
  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var mili = stopwatch.elapsed.inMilliseconds;
    String miliseconds = (mili % 1000).toString().padLeft(3, "0");
    String seconds = ((mili ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((mili ~/ 1000) ~/ 60).toString().padLeft(2, "0");
    return "$minutes:$seconds:$miliseconds";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stopwatch = Stopwatch();
    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  handleStartStop();
                },
                padding: EdgeInsets.all(0),
                child: Container(
                  height: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xff0395eb),
                      width: 4,
                    ),
                  ),
                  child: Text(
                    returnFormattedText(),
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CupertinoButton(
                child: Text(
                  "Reset",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.all(0),
                onPressed: () {
                  stopwatch.reset();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
