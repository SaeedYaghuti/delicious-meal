import 'package:flutter/material.dart';

import '../category/categories_screen.dart';
import '../favorite/favorites_screen.dart';
import '../main_drawer.dart';
import '../meal/meal.dart';

class BottomTabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  BottomTabsScreen(this.favoriteMeals);

  @override
  _BottomTabsScreenState createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  List<Map<String, Object>> pages;

  @override
  initState() {
    pages = [
      {
        'title': 'Categories',
        'page': CategoriesScreen(),
      },
      {
        'title': 'Favorites',
        'page': FavoritesScreen(widget.favoriteMeals),
      },
    ];
    super.initState();
  }

  int currentTabIndex = 0;
  void tabHandler(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[currentTabIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[currentTabIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: tabHandler,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedItemColor: Colors.white,
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor:
                Theme.of(context).primaryColor, // necesery when shifting
            title: Text('Category'),
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            backgroundColor:
                Theme.of(context).primaryColor, // necesery when shifting
            title: Text('Favorites'),
            icon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
