import 'package:flutter/material.dart';

class PlayArea extends StatefulWidget {
  @override
  _PlayAreaState createState() => _PlayAreaState();
}

class _PlayAreaState extends State<PlayArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Play Game', style: TextStyle(fontSize: 24, color: Colors.purple[400], )),
      ),
    );
  }
}