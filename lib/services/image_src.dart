import 'package:flutter/material.dart';
import 'package:kitchen_compendium/data/recipe_list.dart';

Widget imageSrc(index) {
  try {
    if (recipeList[index] != null && recipeList[index].imageThumbnail != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.network(
          recipeList[index].imageThumbnail.toString(),
          width: 50.0, // Set the width
          height: 50.0, // Set the height
          fit: BoxFit
              .cover, // Ensures the image covers the box without distortion
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.broken_image, size: 50.0); // Error fallback
          },
        ),
      );
    } else {
      return const Icon(Icons.food_bank, size: 50.0); // Fallback for null data
    }
  } catch (e) {
    return const Icon(Icons.error_outline, size: 50.0); // Error fallback
  }
}
