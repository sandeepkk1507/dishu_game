import 'package:dishu_game/models/brew.dart';
import 'package:dishu_game/screens/home/brew_tile.dart';
import 'package:dishu_game/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    //print(brews.documents);
    //  brews.forEach((brew) {
    //    print(brew.name);
    //    print(brew.sugars);
    //    print(brew.strength);
    //  });
    return brews == null
        ? Loading()
        : ListView.builder(
            itemCount: brews.length,
            itemBuilder: (context, index) {
              return BrewTile(brew: brews[index]);
            });
  }
}
