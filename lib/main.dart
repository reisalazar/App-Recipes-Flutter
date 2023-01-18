import 'package:flutter/material.dart';
import 'package:recipies/screens/categories_meals_screen.dart';
import 'package:recipies/screens/meal_detail_screen.dart';
import 'package:recipies/screens/settings_screen.dart';
import 'package:recipies/utils/app_routes.dart';
import 'screens/tab_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        AppRoutes.home: (context) => const TabsScreen(),
        AppRoutes.categories_meals: (context) => const CategoriesMealsScreen(),
        AppRoutes.meal_detail: (context) => const MealDetailScreen(),
        AppRoutes.settings: (context) => const SettingsScreen(),
      },
    );
  }
}
