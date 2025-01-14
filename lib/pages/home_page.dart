import 'package:flutter/material.dart';
import 'package:kitchen_compendium/pages/recipe_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RecipeListView();
  }
}
