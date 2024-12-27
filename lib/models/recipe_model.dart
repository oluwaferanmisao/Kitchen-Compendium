import 'package:flutter/material.dart';
import 'package:kitchen_compendium/models/ingredient_model.dart';

class Recipe {
  final String name;
  final int cookingTimeInMinutes;
  final List<Ingredient> ingredients;
  final List<String> preparationSteps;
  final String imageThumbnail;

  Recipe({
    required this.name,
    required this.cookingTimeInMinutes,
    required this.ingredients,
    required this.preparationSteps,
    required this.imageThumbnail,
  });
}
