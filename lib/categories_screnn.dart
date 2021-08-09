
import 'package:flutter/material.dart';

import 'CategoryItem.dart';
import 'models/dummy.dart';
import 'models/categories.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView(
          padding:const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((e) => CategoryItem(e.id,e.title, e.color)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
        ),
  ),
      ),
    );
  }
}
