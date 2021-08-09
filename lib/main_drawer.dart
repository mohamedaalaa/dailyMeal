import 'package:deli_meal/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(IconData icon,String data,Function() tabHandler){
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          data,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        onTap: tabHandler,
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Theme.of(context).accentColor,
              child: Center(
                child: Text(
                  "Cooking up!",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildListTile(Icons.restaurant, 'Meals',(){
            Navigator.of(context).pushReplacementNamed('/');
          },

          ),
          buildListTile(Icons.filter_list_alt, 'Filter',(){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.filtersRouteName);
          },
          ),
        ],
      ),
    );
  }
}
