import 'package:dishu_game/models/category.dart';
import 'package:dishu_game/screens/home/category_tile.dart';
import 'package:dishu_game/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<Category>>(context);
    return categories == null
        ? Loading()
        : ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryTile(
                category: categories[index],
              );
            });
  }
}
