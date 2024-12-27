import "package:flutter/material.dart";
import "package:kitchen_compendium/pages/home_page.dart";

class PageManager extends StatelessWidget {
  const PageManager({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HomePage(),
      ),
    );
  }
}
