import 'package:flutter/material.dart';
import 'package:recipies/models/settings.dart';
import 'package:recipies/screens/categories_meals_screen.dart';
import 'package:recipies/screens/meal_detail_screen.dart';
import 'package:recipies/screens/settings_screen.dart';
import 'package:recipies/utils/app_routes.dart';
import 'screens/tab_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _avaibleMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  Settings settings = Settings();

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _avaibleMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isfavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6:
                  const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
      ),
      routes: {
        AppRoutes.home: (context) => TabsScreen(_favoriteMeals),
        AppRoutes.categories_meals: (context) =>
            CategoriesMealsScreen(_avaibleMeals),
        AppRoutes.meal_detail: (context) =>
            MealDetailScreen(_isfavorite, _toggleFavorite),
        AppRoutes.settings: (context) => SettingsScreen(settings, _filterMeals),
      },
    );
  }
}
