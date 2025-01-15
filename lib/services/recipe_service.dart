// recipe_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitchen_compendium/models/recipe_model.dart';

class RecipeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'recipes';

  // Get all recipes
  Stream<List<Recipe>> getRecipes() {
    return _firestore.collection(collectionName).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Recipe.fromFirestore(doc)).toList());
  }

  // Get single recipe by ID
  Future<Recipe?> getRecipeById(String id) async {
    final doc = await _firestore.collection(collectionName).doc(id).get();
    return doc.exists ? Recipe.fromFirestore(doc) : null;
  }

  Future<void> addRecipe(Recipe recipe) async {
    await _firestore.collection('recipes').add(recipe.toFirestore());
  }
}
