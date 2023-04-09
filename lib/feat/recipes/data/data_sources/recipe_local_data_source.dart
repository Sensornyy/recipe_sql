import 'package:sqflite/sqflite.dart';

import 'package:recipe_sql/feat/recipes/data/model/recipe_model.dart';

abstract class RecipeLocalDataSource {
  Future<void> saveRecipe(RecipeModel recipe);
}

class RecipeLocalDataSourceImpl implements RecipeLocalDataSource {
  final Database db;

  RecipeLocalDataSourceImpl(this.db);

  @override
  Future<void> saveRecipe(RecipeModel recipe) async {
    await db.execute(
      'INSERT INTO recipes (label, calories, image, ingredientLines) VALUES (?, ?, ?, ?)',
      [
        recipe.label,
        recipe.calories,
        recipe.image,
        recipe.ingredientLines.toString(),
      ],
    );
  }
}
