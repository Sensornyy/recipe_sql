import 'package:flutter/material.dart';

import 'package:recipe_sql/feat/recipes/presentation/widgets/recipes_list.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text('Recipe SQL'),
      ),
      body: const RecipesList(),
    );
  }
}
