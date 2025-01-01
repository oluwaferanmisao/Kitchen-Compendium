import 'package:flutter/material.dart';
import 'package:kitchen_compendium/data/recipe_list.dart';
import 'package:kitchen_compendium/pages/recipe_detail_page.dart';
import 'package:kitchen_compendium/services/image_src.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipeList.length,
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailPage(
                        recipe: recipeList[index],
                      ),
                    ));
              },
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                leading: imageSrc(context, index),
                title: Text(
                  recipeList[index].name,
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
  }
}
