import 'package:flutter/material.dart';
import 'package:meals_practice/data/dummy_data.dart';
import 'package:meals_practice/models/meal.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

import './screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> preferredMeals;

  List<Meal> favouriteMeals = [];

  Map<String, bool> mealFilters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _updateFilters(Map<String, bool> updatedFilters) {
    setState(() {
      mealFilters = updatedFilters;
      preferredMeals = DUMMY_MEALS.where((meal) {
        if (mealFilters['glutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (mealFilters['lactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        if (mealFilters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (mealFilters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _addToFavourites(Meal meal) {
    setState(() {
      final index = favouriteMeals.indexOf(meal);
      if (index == -1) {
        favouriteMeals.add(meal);
      } else {
        favouriteMeals.removeAt(index);
      }
    });
  }

  @override
  void initState() {
    preferredMeals = DUMMY_MEALS;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Colors.lightBlue[50],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontFamily: 'Raleway',
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontFamily: 'Raleway',
              ),
              headline6: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(20, 51, 51, 1),
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),

      // home: CategoriesScreen(),
      routes: {
        '/': (_) => TabsScreen(favouriteMeals),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(preferredMeals),
        MealDetailScreen.routeName: (_) =>
            MealDetailScreen(_addToFavourites, favouriteMeals),
        FiltersScreen.routeName: (_) =>
            FiltersScreen(mealFilters, _updateFilters),
      },
    );
  }
}
