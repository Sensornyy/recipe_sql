import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';

abstract class RecipeRepository {
  Future<List<RecipeEntity>> loadRecipes(String query);

  Future<void> saveRecipe(RecipeEntity recipe);
}