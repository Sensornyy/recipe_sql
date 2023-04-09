import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';
import 'package:recipe_sql/feat/recipes/domain/repository/recipe_repository.dart';

class SaveRecipeUseCase {
  final RecipeRepository _recipeRepository;

  SaveRecipeUseCase(this._recipeRepository);

  Future<void> call(RecipeEntity recipe) async {
    return await _recipeRepository.saveRecipe(recipe);
  }
}
