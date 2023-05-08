part of 'recipe_bloc.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState.initial() = _Initial;

  const factory RecipeState.loading() = _Loading;

  const factory RecipeState.loaded(List<RecipeEntity> recipes) = _Loaded;

  const factory RecipeState.saved() = _Saved;

  const factory RecipeState.deleted(RecipeEntity recipe) = _Deleted;

  const factory RecipeState.edited(
    RecipeEntity recipe,
    RecipeEntity newRecipe,
  ) = _Edited;

  const factory RecipeState.failed() = _Failed;
}
