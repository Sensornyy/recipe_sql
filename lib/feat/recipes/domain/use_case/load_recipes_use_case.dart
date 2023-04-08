import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';
import 'package:recipe_sql/feat/recipes/domain/repository/recipe_repository.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  SearchRecipesUseCase(this._recipeRepository);

  Future<List<RecipeEntity>> getRecipes(String query) {
    return _recipeRepository.loadRecipes(query);
  }
}
