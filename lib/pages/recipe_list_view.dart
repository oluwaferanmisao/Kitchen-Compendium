import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kitchen_compendium/services/recipe_service.dart';
import 'package:kitchen_compendium/models/recipe_model.dart';
import 'package:kitchen_compendium/pages/recipe_detail_page.dart';

class RecipeListView extends StatelessWidget {
  RecipeListView({super.key});

  final RecipeService _recipeService = RecipeService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Recipe>>(
      stream: _recipeService.getRecipes(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
                Text("No data found!"),
              ],
            ),
          );
        }

        final recipes = snapshot.data!;

        return ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(
                          recipe: recipes[index],
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(
                        recipes[index].imageThumbnail,
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 50,
                          );
                        },
                      ),
                    ),
                    title: Text(
                      recipes[index].name,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    subtitle: Text(
                      "Tap for more details",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16.0,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
