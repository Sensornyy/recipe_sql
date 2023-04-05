import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';

abstract class RecipeRepository {
  List<RecipeEntity> getRecipes();
}