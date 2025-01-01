import 'package:flutter/material.dart';
import 'package:kitchen_compendium/data/recipe_list.dart';

Widget imageSrc(context, index) {
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
            return Icon(
              Icons.broken_image,
              size: 50.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ); // Error fallback
          },
        ),
      );
    } else {
      return Icon(
        Icons.food_bank,
        size: 50.0,
        color: Theme.of(context).colorScheme.onPrimary,
      ); // Fallback for null data
    }
  } catch (e) {
    return Icon(
      Icons.error_outline,
      size: 50.0,
      color: Theme.of(context).colorScheme.onPrimary,
    ); // Error fallback
  }
}
