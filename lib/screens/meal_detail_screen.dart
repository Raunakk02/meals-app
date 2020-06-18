import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildItemList(
      BuildContext context, String listTitle, List<String> listItems,
      {bool isStepList = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            listTitle,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            border: Border.symmetric(
                vertical: BorderSide(
              color: Colors.grey,
            )),
          ),
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    isStepList
                        ? '#${index + 1} ${listItems[index]}'
                        : listItems[index],
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                color: isStepList ? Colors.lightBlueAccent : Colors.green,
              );
            },
            itemCount: listItems.length,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            selectedMeal.title,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildItemList(
            context,
            'Ingredients',
            selectedMeal.ingredients,
          ),
          buildItemList(
            context,
            'Steps',
            selectedMeal.steps,
            isStepList: true,
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
