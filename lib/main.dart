import 'package:deli_meal/category_meals_screen.dart';
import 'package:deli_meal/filters_screen.dart';
import 'package:deli_meal/meal_details.dart';
import 'package:deli_meal/models/dummy.dart';
import 'package:deli_meal/models/meals.dart';
import 'package:deli_meal/models/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = dummyMeals;
  List<Meal> favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeals = dummyMeals.where((element) {
        if (_filters['gluten'] == true && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !element.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String id) {
    final existingIndex =
        favouriteMeals.indexWhere((element) => element.id == id);
    if (existingIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(
        () {
          favouriteMeals
              .add(dummyMeals.firstWhere((element) => element.id == id));
        },
      );
    }
  }

  bool isMealFavourite(String id) {
    return favouriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 255, 255, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline5: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold))),
      routes: {
        '/': (_) => TabsScreen(favouriteMeals),
        CategoryMealsScreen.categoryMealsRoute: (_) => CategoryMealsScreen(
              availableMeals,
            isMealFavourite
            ),
        MealDetail.mealDetailsRoute: (_) => MealDetail(toggleFavourite,isMealFavourite),
        FiltersScreen.filtersRouteName: (_) =>
            FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
