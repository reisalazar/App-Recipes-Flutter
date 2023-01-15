import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisCount: 20,
        mainAxisExtent: 20,
      ),
      children: [],
    );
  }
}
