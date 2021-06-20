import 'package:flutter/material.dart';

import '../category/categories_screen.dart';
import '../favorite/favorites_screen.dart';
import '../meal/meal.dart';

class TopTabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TopTabsScreen(this.favoriteMeals);

  @override
  _TopTabsScreenState createState() => _TopTabsScreenState();
}

class _TopTabsScreenState extends State<TopTabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          // title: Text('Meals'),
          // bottom: TabBar(
          title: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'Favorites',
              ),
              Tab(
                text: 'CAT',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoritesScreen(widget.favoriteMeals),
            Center(
              child: Text('We keep cat here'),
            ),
          ],
        ),
      ),
    );
  }
}
