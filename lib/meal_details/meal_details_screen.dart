// @dart=2.9
import 'package:flutter/material.dart';
import '../meal/dummy_meals.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details-screen';
  Function favoritMealHandler;
  Function checkFavority;
  MealDetailsScreen(this.favoritMealHandler, this.checkFavority);

  @override
  Widget build(BuildContext context) {
    var mealId = ModalRoute.of(context).settings.arguments as String;
    var meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget buildTitleSection(String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget buildContainer({child: Widget}) {
      return Container(
        width: 300,
        height: 200,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitleSection('Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Container(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(meal.ingredients[index])),
                  );
                },
              ),
            ),
            buildTitleSection('Steps'),
            buildContainer(
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ), // buildContainer
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          checkFavority(mealId) ? Icons.favorite : Icons.favorite_border,
          color: Colors.pinkAccent,
        ),
        onPressed: () => favoritMealHandler(mealId),
      ),
      // delete button
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.delete),
      //   onPressed: () {
      //     // close this page
      //     Navigator.of(context).pop(mealId);
      //   },
      // ),
    );
  }
}
