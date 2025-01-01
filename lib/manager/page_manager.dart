import "package:flutter/material.dart";
import "package:kitchen_compendium/pages/home_page.dart";

class PageManager extends StatelessWidget {
  const PageManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Kitchen Compendium"),
        centerTitle: true,
      ),
      body: const Center(
        child: HomePage(),
      ),
    );
  }
}
