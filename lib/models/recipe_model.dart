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
}
