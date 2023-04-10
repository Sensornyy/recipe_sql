import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import 'package:recipe_sql/feat/recipes/data/model/recipe_model.dart';

abstract class RecipeLocalDataSource {
  Future<void> saveRecipe(RecipeModel recipe);

  Future<List<RecipeModel>> getRecipes();

  Future<void> deleteRecipe(RecipeModel recipe);
}

class RecipeLocalDataSourceImpl implements RecipeLocalDataSource {
  final Database db;

  RecipeLocalDataSourceImpl(this.db);

  @override
  Future<void> saveRecipe(RecipeModel recipe) async {
    final ingredients = jsonEncode(recipe.ingredientLines);

    await db.execute(
      'INSERT INTO recipes (label, calories, image, ingredientLines) VALUES (?, ?, ?, ?)',
      [recipe.label, recipe.calories, recipe.image, ingredients],
    );
  }

  @override
  Future<List<RecipeModel>> getRecipes() async {
    final recipes = await db.rawQuery('SELECT * FROM recipes');

    return recipes.map((recipe) => RecipeModel.fromSql(recipe)).toList();
  }

  @override
  Future<void> deleteRecipe(RecipeModel recipe) async {
    final result =
        await db.rawDelete('DELETE FROM recipes WHERE label = ?', [recipe.label]);

    assert(result == 1);
  }
}
