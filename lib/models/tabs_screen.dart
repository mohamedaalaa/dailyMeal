import 'package:deli_meal/categories_screnn.dart';
import 'package:deli_meal/favourite.dart';
import 'package:deli_meal/main_drawer.dart';
import 'package:flutter/material.dart';

import 'meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favouriteMeals;

  TabsScreen(this._favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> pages=[] ;
  int _selectedItem = 0;

  @override
  void initState() {
    pages=
    [
    {
    'page': CategoriesScreen(),
    'title': 'Category',
    },
    {
    'page': FavouriteScreen(widget._favouriteMeals),
    'title': 'Favourite',
    }
    ];

    super.initState();
  }
  void _selectedWidget(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(pages[_selectedItem]['title']),
        ),
        drawer: MainDrawer(),
        body: pages[_selectedItem]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedWidget,
          backgroundColor: Theme.of(context).primaryColor,
          selectedFontSize: 20,
          unselectedFontSize: 15,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedItem,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                size: 17,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 17,
              ),
              label: 'Favourites',
            ),
          ],
        ),
      ),
    );
  }
}
