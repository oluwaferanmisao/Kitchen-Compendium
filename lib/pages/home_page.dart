import 'package:flutter/material.dart';
import 'package:kitchen_compendium/data/recipe_list.dart';
import 'package:kitchen_compendium/services/image_src.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipeList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: imageSrc(index),
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
