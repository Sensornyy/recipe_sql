import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';
import 'package:recipe_sql/feat/recipes/domain/repository/recipe_repository.dart';

class EditRecipeUseCase {
  final RecipeRepository _recipeRepository;

  EditRecipeUseCase(this._recipeRepository);

  Future<void> call(RecipeEntity recipe, RecipeEntity newRecipe) async {
    return await _recipeRepository.editRecipe(recipe, newRecipe);
  }
}
