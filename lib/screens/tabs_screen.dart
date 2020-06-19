import 'package:flutter/material.dart';
import 'package:meals_practice/models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favourites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget buildBody(){
      switch (tabIndex) {
        case 0:
          return CategoriesScreen();
          break;
        case 1:
          return FavouritesScreen(widget.favouriteMeals);
          break;
        default:
          return CategoriesScreen();
      }
    }

    return Scaffold(      
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),

      drawer: MainDrawer(),

      body: buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        onTap: (curIndex){
          setState(() {
            tabIndex = curIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourites')
          ),
        ],
      ),
    );
  }
}
