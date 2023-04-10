import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';
import 'package:recipe_sql/feat/recipes/domain/repository/recipe_repository.dart';

class GetRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipesUseCase(this._recipeRepository);

  Future<List<RecipeEntity>> call() async {
    return await _recipeRepository.getRecipes();
  }
}
