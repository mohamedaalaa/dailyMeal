import 'package:deli_meal/meal_item.dart';
import 'package:flutter/material.dart';
import 'models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String categoryMealsRoute = '/category-meal';
  final List<Meal> availableMeals;
  bool Function(String id) isFavourite;

  CategoryMealsScreen(this.availableMeals,this.isFavourite);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categoryTitle;
  List<Meal>? categoryMeal;
  bool _loadedData=false;

  @override
  void didChangeDependencies() {
    if(!_loadedData){
      final routeArgs =
      ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryMeal = widget.availableMeals
          .where((element) => element.categories.contains(categoryId))
          .toList();
      _loadedData=true;
    }
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: categoryMeal![index].id,
              imageUrl: categoryMeal![index].imageUrl,
              title: categoryMeal![index].title,
              duration: categoryMeal![index].duration,
              complexity: categoryMeal![index].complexity,
              affordability: categoryMeal![index].affordability,
            );
          },
          itemCount: categoryMeal!.length,
        ),
    );
  }
}
