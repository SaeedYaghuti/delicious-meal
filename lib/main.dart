// @dart=2.9
// import 'package:deli_meal/category/categories_screen.dart';
import './meal/dummy_meals.dart';
import 'package:deli_meal/meal/meal.dart';
import 'package:deli_meal/route.dart';
import 'package:flutter/material.dart';

import './theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filtersOption = {
    'glutenFree': false,
    'vegetarian': false,
    'vagan': false,
    'lactoseFree': false,
  };

  List<Meal> favoriteMeals = [];

  void toggleMealInFavoritList(String mealId) {
    var index = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (index >= 0) {
      setState(() {
        favoriteMeals.removeAt(index);
      });
    } else {
      var meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
      setState(() {
        favoriteMeals.add(meal);
      });
    }
  }

  bool isFovorite(String mealId) {
    return favoriteMeals.any((meal) => meal.id == mealId);
  }

  List<Meal> customizedMeal = DUMMY_MEALS;
  void setFiltersOption(Map<String, bool> newFilters) {
    setState(() {
      filtersOption = newFilters;
      customizedMeal = DUMMY_MEALS.where((meal) {
        if (filtersOption['glutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (filtersOption['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (filtersOption['vagan'] && !meal.isVegan) {
          return false;
        }
        if (filtersOption['lactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: deliMealTheme,
      routes: deliMealRoutes(
        customizedMeal: customizedMeal,
        filtersOption: filtersOption,
        filterHandler: setFiltersOption,
        favoriteMeals: favoriteMeals,
        favoritMealHandler: toggleMealInFavoritList,
        checkFavority: isFovorite,
      ),
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
    );
  }
}
