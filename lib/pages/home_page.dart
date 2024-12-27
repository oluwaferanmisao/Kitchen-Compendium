import 'package:flutter/material.dart';
import 'package:kitchen_compendium/models/ingredient_model.dart';
import 'package:kitchen_compendium/models/recipe_model.dart';

List recipeList = [
  Recipe(
    name: "White Rice",
    cookingTimeInMinutes: 30,
    ingredients: [
      Ingredient(name: "Raw Rice", quantity: 1, unit: "De-rica"),
      Ingredient(name: "Water", quantity: 2, unit: "Cups"),
    ],
    preparationSteps: [
      'Put the water into a pot and place on a stove, rinse the raw rice into the water and leave for 20 minutes, add salt to satisfaction then seive.'
    ],
    imageThumbnail:
        'https://images.pexels.com/photos/4187621/pexels-photo-4187621.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  ),
  Recipe(
    name: "Jollof Rice",
    cookingTimeInMinutes: 120,
    ingredients: [
      Ingredient(name: "Raw Rice", quantity: 1, unit: "De-rica"),
      Ingredient(name: "Water", quantity: 2, unit: "Cups"),
      Ingredient(name: "Seasoning", quantity: 3, unit: "Teaspoons"),
    ],
    preparationSteps: [
      'Put the water into a pot and place on a stove, rinse the raw rice into the water and leave for 20 minutes, add salt to satisfaction then seive.'
    ],
    imageThumbnail:
        'https://images.pexels.com/photos/4187621/pexels-photo-4187621.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipeList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image(
            image: NetworkImage(
              recipeList[index].imageThumbnail.toString(),
            ),
          ),
          title: Text(recipeList[index].name),
          subtitle: Row(
            children: [
              Text(recipeList[index].cookingTimeInMinutes.toString()),
              const Text(' mins'),
            ],
          ),
        );
      },
    );
  }
}
