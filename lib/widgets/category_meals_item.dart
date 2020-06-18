import 'package:flutter/material.dart';
import 'package:meals_practice/models/meal.dart';

class CategoryMealsItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  CategoryMealsItem({
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;

      default:
        return 'Unknown';
    }
  }

  String get affordibilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Image.network(imageUrl),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  height: 100,
                  width: 200,
                  alignment: Alignment.bottomLeft,
                  color: Colors.black54,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 4,
                    ),
                    Text('$duration mins'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 4,
                    ),
                    Text(complexityText),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 4,
                    ),
                    Text(affordibilityText),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
