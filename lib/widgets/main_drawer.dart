import 'package:flutter/material.dart';
import 'package:meals_practice/screens/categories_screen.dart';
import 'package:meals_practice/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Center(
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
            leading: Icon(Icons.category,size: 30,),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
            leading: Icon(Icons.tune,size: 30,),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}
