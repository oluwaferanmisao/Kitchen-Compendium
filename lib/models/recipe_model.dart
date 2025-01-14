import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitchen_compendium/models/ingredient_model.dart';

class Recipe {
  final String imageThumbnail;
  final String name;
  final int cookingTimeInMinutes;
  final List<Ingredient> ingredients;
  final List<String> preparationSteps;

  Recipe({
    required this.imageThumbnail,
    required this.name,
    required this.cookingTimeInMinutes,
    required this.ingredients,
    required this.preparationSteps,
  });

  // Convert Firestore Document to Recipe object
  factory Recipe.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Recipe(
      imageThumbnail: data['imageThumbnail'] ?? '',
      name: data['name'] ?? '',
      cookingTimeInMinutes: data['cookingTimeInMinutes'] ?? 0,
      ingredients: (data['ingredients'] as List?)
              ?.map((ingredient) =>
                  Ingredient.fromMap(ingredient as Map<String, dynamic>))
              .toList() ??
          [],
      preparationSteps: List<String>.from(data['preparationSteps'] ?? []),
    );
  }

  // Convert Recipe object to Map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'imageThumbnail': imageThumbnail,
      'name': name,
      'cookingTimeInMinutes': cookingTimeInMinutes,
      'ingredients':
          ingredients.map((ingredient) => ingredient.toMap()).toList(),
      'preparationSteps': preparationSteps,
    };
  }
}
