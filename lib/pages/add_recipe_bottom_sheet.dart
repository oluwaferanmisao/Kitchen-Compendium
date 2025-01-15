import 'package:flutter/material.dart';
import 'package:kitchen_compendium/models/recipe_model.dart';
import 'package:kitchen_compendium/models/ingredient_model.dart';
import 'package:kitchen_compendium/services/recipe_service.dart';

class AddRecipeBottomSheet extends StatefulWidget {
  @override
  _AddRecipeBottomSheetState createState() => _AddRecipeBottomSheetState();
}

class _AddRecipeBottomSheetState extends State<AddRecipeBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final RecipeService _recipeService = RecipeService();

  String name = '';
  String imageThumbnail = '';
  int cookingTimeInMinutes = 0;
  List<Ingredient> ingredients = [];
  List<String> preparationSteps = [];

  final _ingredientNameController = TextEditingController();
  final _ingredientAmountController = TextEditingController();
  final _ingredientUnitController = TextEditingController();
  final _stepController = TextEditingController();

  void _addIngredient() {
    if (_ingredientNameController.text.isNotEmpty &&
        _ingredientAmountController.text.isNotEmpty) {
      setState(() {
        ingredients.add(
          Ingredient(
            name: _ingredientNameController.text,
            amount: _ingredientAmountController.text,
            unit: _ingredientUnitController.text,
          ),
        );
      });

      _ingredientNameController.clear();
      _ingredientAmountController.clear();
      _ingredientUnitController.clear();
    }
  }

  void _addStep() {
    if (_stepController.text.isNotEmpty) {
      setState(() {
        preparationSteps.add(_stepController.text);
      });
      _stepController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) => Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              controller: controller,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add New Recipe',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const Divider(),
                // Recipe Name
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Recipe Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a recipe name';
                    }
                    return null;
                  },
                  onSaved: (value) => name = value!,
                ),
                const SizedBox(height: 16),

                // Image URL
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Image URL'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an image URL';
                    }
                    return null;
                  },
                  onSaved: (value) => imageThumbnail = value!,
                ),
                const SizedBox(height: 16),

                // Cooking Time
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Cooking Time (minutes)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter cooking time';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) => cookingTimeInMinutes = int.parse(value!),
                ),
                const SizedBox(height: 24),

                // Ingredients Section
                Text('Ingredients',
                    style: Theme.of(context).textTheme.titleMedium),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _ingredientNameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: _ingredientAmountController,
                        decoration: const InputDecoration(labelText: 'Amount'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: _ingredientUnitController,
                        decoration: const InputDecoration(labelText: 'Unit'),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _addIngredient,
                    ),
                  ],
                ),

                // Ingredients List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    final ingredient = ingredients[index];
                    return ListTile(
                      title: Text(
                          '${ingredient.name} - ${ingredient.amount} ${ingredient.unit}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            ingredients.removeAt(index);
                          });
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // Preparation Steps Section
                Text('Preparation Steps',
                    style: Theme.of(context).textTheme.titleMedium),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _stepController,
                        decoration: const InputDecoration(
                            labelText: 'Step Description'),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _addStep,
                    ),
                  ],
                ),

                // Steps List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: preparationSteps.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(preparationSteps[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            preparationSteps.removeAt(index);
                          });
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Submit Button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      if (ingredients.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Please add at least one ingredient')),
                        );
                        return;
                      }

                      if (preparationSteps.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Please add at least one preparation step')),
                        );
                        return;
                      }

                      final recipe = Recipe(
                        name: name,
                        imageThumbnail: imageThumbnail,
                        cookingTimeInMinutes: cookingTimeInMinutes,
                        ingredients: ingredients,
                        preparationSteps: preparationSteps,
                      );

                      try {
                        await _recipeService.addRecipe(recipe);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Recipe added successfully!')),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error adding recipe: $e')),
                        );
                      }
                    }
                  },
                  child: const Text('Save Recipe'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ingredientNameController.dispose();
    _ingredientAmountController.dispose();
    _ingredientUnitController.dispose();
    _stepController.dispose();
    super.dispose();
  }
}
