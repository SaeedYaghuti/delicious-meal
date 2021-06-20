// @dart=2.9
import 'package:deli_meal/meal/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({
    @required this.id,
    @required this.title,
    @required this.color,
  });

  void itemTapHandler(BuildContext context) {
    // define witch should be run; and send argumants
    // to take arguments in distination: var args = ModalRoute.of(context).settings.argumenats
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (ctx) => CategoryMealsScreen(
    //       categoryId: id,
    //       categoryTitle: title,
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => itemTapHandler(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
