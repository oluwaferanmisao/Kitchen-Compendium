import "package:flutter/material.dart";
import "package:kitchen_compendium/pages/home_page.dart";

class PageManager extends StatelessWidget {
  const PageManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Kitchen Compendium"),
        ),
      ),
      body: const Center(
        child: HomePage(),
      ),
    );
  }
}
