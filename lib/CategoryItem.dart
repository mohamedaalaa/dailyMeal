
import 'package:deli_meal/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String id;
  String title;
  Color color;
  CategoryItem(this.id,this.title, this.color);
  
  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(
        CategoryMealsScreen.categoryMealsRoute , arguments: {'id':id,'title':title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(padding: const EdgeInsets.all(15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          color.withOpacity(.7),
          color,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
        borderRadius: BorderRadius.circular(15)
      ),
      ),
    );
  }
}
