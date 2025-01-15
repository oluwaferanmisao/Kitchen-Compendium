import 'package:flutter/material.dart';
import 'package:kitchen_compendium/pages/add_recipe_bottom_sheet.dart';

class UploadRecipe extends StatelessWidget {
  const UploadRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          useSafeArea: true,
          isScrollControlled: true,
          showDragHandle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
          context: context,
          builder: (context) {
            return AddRecipeBottomSheet();
          },
        );
      },
      icon: const Icon(Icons.add),
    );
  }
}
