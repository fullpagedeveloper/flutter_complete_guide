import 'package:flutter/material.dart';
import '../model/meals_model.dart';
import '../widgets/meals_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<MealsModel> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<MealsModel> displayMeals;
  bool _loadInitData = false;

  @override
  void initState() {
    // final routeArgs =
    // ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final categoryId = routeArgs['id'];
    // categoryTitle = routeArgs['title'];
    // displayMeals = DUMMY_MEALS.where((meal) {
    //   return meal.categories.contains(categoryId);
    //}).toList();

    super.initState();
  }

  ///
  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      print("if===== ${!_loadInitData}");
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadInitData = true;
      print("===== $_loadInitData");
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(
      () {
        displayMeals.removeWhere((meal) => meal.id == mealId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
