class Recipe {
  final String name;
  final DateTime cookingTime;
  final List ingredients;
  final List<String> preparationSteps;
  final String imageThumbnail;

  Recipe({
    required this.name,
    required this.cookingTime,
    required this.ingredients,
    required this.preparationSteps,
    required this.imageThumbnail,
  });
}
