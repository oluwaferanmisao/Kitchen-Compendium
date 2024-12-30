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
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 4.0,
          ),
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              leading: imageSrc(index),
              title: Text(
                recipeList[index].name,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                "Tap for more details",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16.0,
                color: Colors.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}
