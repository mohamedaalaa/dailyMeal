import 'package:flutter/material.dart';

import 'meal_item.dart';
import 'models/meals.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  FavouriteScreen(this.favouriteMeals);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget.favouriteMeals.isEmpty){
      return Center(
        child: Text("you have no favourites yet",style: Theme.of(context).textTheme.headline5,) ,
      );
    }else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: widget.favouriteMeals[index].id,
            imageUrl: widget.favouriteMeals[index].imageUrl,
            title: widget.favouriteMeals[index].title,
            duration: widget.favouriteMeals[index].duration,
            complexity: widget.favouriteMeals[index].complexity,
            affordability: widget.favouriteMeals[index].affordability,
          );
        },
        itemCount: widget.favouriteMeals.length,
      );

    }
  }
}
