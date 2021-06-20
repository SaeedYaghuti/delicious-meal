// @dart=2.9
import 'package:deli_meal/meal/meal_item.dart';
import 'package:flutter/material.dart';

import './meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  List<Meal> customizedMeal;

  CategoryMealsScreen(this.customizedMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  List<Meal> displayedMeal;
  var initializedFirstTime = false;

  @override
  void didChangeDependencies() {
    // didChangeDependicies is not calling after each setState(removeItem)
    // so it is not necessery to use initializedFirstTime parameter
    // print('> runing didChangeDependencies...');

    if (!initializedFirstTime) {
      var routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routeArgs['title'];
      final categoryId = routeArgs['id'];

      displayedMeal = widget.customizedMeal
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      initializedFirstTime = true;
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    // we don't have access to context
    // it runs before initialization of context
    super.initState();
  }

  void deleteMealHandler(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: displayedMeal.length,
        itemBuilder: (bContext, index) {
          var meal = displayedMeal[index];
          // return Text('Meals Title: ${relatedMeals[index].title}');
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
            deleteHandler: deleteMealHandler,
          );
        },
      ),
    );
  }
}
