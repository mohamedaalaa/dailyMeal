import 'package:deli_meal/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const filtersRouteName = '/filters_screen';
  final void Function(Map<String, bool>) _saveFilters;
  final Map<String,bool> currentFilters;
  FiltersScreen(this.currentFilters,this._saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _guletenFree = false;
  bool _vegetarien = false;
  bool _vegan = false;
  bool _lactose = false;

  @override
  initState(){
    _guletenFree= widget.currentFilters['gluten'] as bool;
    _vegetarien= widget.currentFilters['vegetarian'] as bool;
    _vegan= widget.currentFilters['vegan'] as bool;
    _lactose= widget.currentFilters['lactose'] as bool;
    super.initState();
  }

  Widget buildSwitchListTile(
    String titleText,
    String subtitleText,
    bool currentValue,
    void Function(bool)? onChanged,
  ) {
    return SwitchListTile(
      title: Text(
        titleText,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        subtitleText,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
      value: currentValue,
      onChanged: onChanged,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: <Widget>[
            IconButton(onPressed:(){
              Map<String,bool> selectedFilters={
                'gluten':_guletenFree,
                'lactose':_lactose,
                'vegan':_vegan,
                'vegetarian':_vegetarien,
              };
              widget._saveFilters(selectedFilters);
              //Navigator.of(context).pop(CategoryMealsScreen.categoryMealsRoute);
            }, icon: (Icon(Icons.save,)),)
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: Text(
                  "Adjust your meals selections",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten free meals',
                  _guletenFree,
                  (value) {
                    setState(() {
                      _guletenFree = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose free meals',
                  _lactose,
                  (value) {
                    setState(() {
                      _lactose = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose-free',
                  'Only include vegetarien free meals',
                  _vegetarien,
                  (value) {
                    setState(() {
                      _vegetarien = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose-free',
                  'Only include vegan free meals',
                  _vegan,
                  (value) {
                    setState(() {
                      _vegan = value;
                    },
                    );
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
