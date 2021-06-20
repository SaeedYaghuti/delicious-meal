import 'package:flutter/material.dart';

import '../meal/meal.dart';
import '../meal/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = '/favorites';
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.favoriteMeals.isEmpty
        ? Center(
            child: Text('The Favorites'),
          )
        : ListView.builder(
            itemCount: widget.favoriteMeals.length,
            itemBuilder: (bContext, index) {
              var meal = widget.favoriteMeals[index];
              // return Text('Meals Title: ${relatedMeals[index].title}');
              return MealItem(
                id: meal.id,
                title: meal.title,
                imageUrl: meal.imageUrl,
                affordability: meal.affordability,
                complexity: meal.complexity,
                duration: meal.duration,
                deleteHandler: () {},
              );
            },
          );
  }
}
