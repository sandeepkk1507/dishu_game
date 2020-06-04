import 'dart:async';

import 'package:dishu_game/screens/play/play_area.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final Stopwatch stopwatch = Stopwatch();
  String displayText = 'Start';
  String stopTimeToDisplay = '00:00:00';
  bool startIsPressed = false;
  bool stopIsPressed = false;
  bool resetIsPressed = false;
  final dur = const Duration(milliseconds: 1);

void startTimer() {
  Timer(dur, keepRunning);
}

void keepRunning() {
  if(stopwatch.isRunning) {
    startTimer();
  }
  setState(() {
    stopTimeToDisplay = (stopwatch.elapsed.inMinutes%60).toString().padLeft(2, "0") + ":"
                          + (stopwatch.elapsed.inSeconds%60).toString().padLeft(2, "0") + ":"
                          + (stopwatch.elapsed.inMilliseconds%60).toString().padLeft(2, "0");
  });
}
  void startStopWatch() {
    setState(() {
      displayText = 'Stop';
      startIsPressed = true;
    });
    stopwatch.start();
    startTimer();
  }

  void stopStopWatch() {
    setState(() {
      displayText = 'Start';
    });
    stopwatch.stop();
  }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Timer'),
                    FlatButton(
                      child: Text(displayText),
                      onPressed: startIsPressed ? stopStopWatch : startStopWatch,
                    ),
                    Text(stopTimeToDisplay),
                    Text('Stars'),
                  ],
                ),
              ),
              PlayArea(),
            ],
          ),
        );
      }
    

}