import 'package:deli_meal/models/dummy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  void Function(String m) toggle;
  bool Function(String id) isMealFavourited;


  MealDetail(this.toggle, this.isMealFavourited);

  static final String mealDetailsRoute = '/meal_details';
  Widget buildTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildIngredientsAndSteps(
      BuildContext context, List<String> steps, int count) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 180,
      width: 300,
      child: ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                (index + 1).toString(),
              ),
            ),
            title: Text(
              steps[index],
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        dummyMeals.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(selectedMeal.imageUrl,width: double.infinity,),
            buildTitle(context, "Ingredients"),
            buildIngredientsAndSteps(context, selectedMeal.ingredients,
                selectedMeal.ingredients.length),
            buildTitle(context, "Title"),
            buildIngredientsAndSteps(
              context,
              selectedMeal.steps,
              selectedMeal.steps.length,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          toggle(mealId);
        },
        child: isMealFavourited(mealId)? Icon(Icons.star):Icon(Icons.star_border)
      ),
    );
  }
}
