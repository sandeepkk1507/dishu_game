import 'package:dishu_game/models/category.dart';
import 'package:dishu_game/screens/play/play_screen.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({this.category});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => PlayScreen(),
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Container(
                color: Colors.blue[200],
              ),
              Container(
                color: Colors.black26,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        category.categoryName,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        category.categoryType,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
