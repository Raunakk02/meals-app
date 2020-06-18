import 'package:flutter/material.dart';
import 'package:meals_practice/screens/meal_detail_screen.dart';
import 'package:meals_practice/widgets/category_meals_item.dart';

import '../data/dummy_data.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  final List<Meal> preferredMeals;
  CategoryMealsScreen(this.preferredMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    final List<Meal> categoryMeals = preferredMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    void viewMealDetails(String mealId) {
      Navigator.of(context).pushNamed(
        MealDetailScreen.routeName,
        arguments: mealId,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () => viewMealDetails(categoryMeals[index].id),
            child: CategoryMealsItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            ),
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
