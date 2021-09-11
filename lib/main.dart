import 'dart:ui';

import 'package:flutter/material.dart';
import './dummy_data.dart';
import './model/meals_model.dart';
import './screens/meal_detail_screen,dart.dart';
import './screens/tabs_screen.dart';
import 'screens/bottom_navigation.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/filter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filtes = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<MealsModel> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filtes = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filtes['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if(_filtes['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if(_filtes['vegan'] && !meal.isVegan) {
          return false;
        }
        if(_filtes['vegetarian'] && !meal.isVegetarian) {
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
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',

      /// default is
      routes: {
        '/': (context) => BottomNavigation(),
        // '/': (context) => TabsScreen(),
        // '/category-meals': (context) => CategoryMealsScreen(), cara pertama
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),//cara kedua
        FilterScreen.routeName: (context) => FilterScreen(_filtes ,_setFilters),
      },

      /// ini menggunakan onGenerateRoute and onUnknownRoute
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   // if(settings.name == './meal-detail') {
      //   //   return ...;
      //   // } else if(settings.name == '/something-else') {
      //   //   return ...;
      //   // }
      //   // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text(
          'Navigation Time',
        ),
      ),
    );
  }
}
