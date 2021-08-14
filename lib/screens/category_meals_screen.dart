import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meals_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  // ini menangkap data dari constructor
  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoriesMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            id: categoriesMeals[index].id,
            title: categoriesMeals[index].title,
            imageUrl: categoriesMeals[index].imageUrl,
            duration: categoriesMeals[index].duration,
            complexity: categoriesMeals[index].complexity,
            affordability: categoriesMeals[index].affordability,
          );
        },
        itemCount: categoriesMeals.length,
      ),
    );
  }
}
