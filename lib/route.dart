// @dart=2.9
import 'package:deli_meal/favorite/favorites_screen.dart';

import './filter/filter_screen.dart';
import './tabs/tabs_bottom_screen.dart';
import './tabs/tabs_top_screen.dart';

import './meal/category_meals_screen.dart';
import './meal_details/meal_details_screen.dart';

import './category/categories_screen.dart';
import './meal/meal.dart';

deliMealRoutes({
  List<Meal> customizedMeal,
  List<Meal> favoriteMeals,
  Function favoritMealHandler,
  Function checkFavority,
  Map<String, bool> filtersOption,
  Function filterHandler,
}) =>
    {
      // '/': (ctx) => TopTabsScreen(),
      '/': (ctx) => BottomTabsScreen(favoriteMeals),
      CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
            customizedMeal,
          ),
      MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(
            favoritMealHandler,
            checkFavority,
          ),
      FiltersScreen.routeName: (ctx) => FiltersScreen(
            filtersOption: filtersOption,
            filterHandler: filterHandler,
          ),
      FavoritesScreen.routeName: (ctx) => FavoritesScreen(favoriteMeals),
    };
