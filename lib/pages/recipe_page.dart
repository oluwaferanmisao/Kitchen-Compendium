import 'package:flutter/material.dart';
import 'package:kitchen_compendium/models/recipe_model.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({required this.recipe, super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe image
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                recipe.imageThumbnail,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              recipe.name,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  recipe.cookingTimeInMinutes.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  ' minutes',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text('Ingredients', style: Theme.of(context).textTheme.titleLarge),
            ListView.builder(
              shrinkWrap: true,
              itemCount: recipe.ingredients.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    recipe.ingredients[index].name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    '${recipe.ingredients[index].quantity} ${recipe.ingredients[index].unit}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  leading: Icon(
                    Icons.restaurant,
                    color: Theme.of(context).iconTheme.color,
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
            Text('Preparation Steps',
                style: Theme.of(context).textTheme.titleLarge),
            Text(
                recipe.preparationSteps
                    .toString()
                    .replaceAll('[', '')
                    .replaceAll(']', ''),
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
