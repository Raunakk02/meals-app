import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';
import '../widgets/category_meals_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {

    void viewMealDetails(String mealId) {
      Navigator.of(context).pushNamed(
        MealDetailScreen.routeName,
        arguments: mealId,
      );
    }

    return favouriteMeals.isEmpty
        ? Center(
            child: Text(
            'No favourite meals yet!',
            style: Theme.of(context).textTheme.headline6,

          ))
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return InkWell(
                onTap: () => viewMealDetails(favouriteMeals[index].id),
                child: CategoryMealsItem(
                  title: favouriteMeals[index].title,
                  imageUrl: favouriteMeals[index].imageUrl,
                  duration: favouriteMeals[index].duration,
                  complexity: favouriteMeals[index].complexity,
                  affordability: favouriteMeals[index].affordability,
                ),
              );
            },
            itemCount: favouriteMeals.length,
          );
  }
}
