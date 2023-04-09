import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';
import 'package:recipe_sql/feat/recipes/domain/repository/recipe_repository.dart';

class LoadRecipesUseCase {
  final RecipeRepository _recipeRepository;

  LoadRecipesUseCase(this._recipeRepository);

  Future<List<RecipeEntity>> call(String query) async {
    return await _recipeRepository.loadRecipes(query);
  }
}
