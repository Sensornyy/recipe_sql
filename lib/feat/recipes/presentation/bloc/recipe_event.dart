part of 'recipe_bloc.dart';

@freezed
class RecipeEvent with _$RecipeEvent {
  const factory RecipeEvent.load(String query) = _Load;

  const factory RecipeEvent.save(RecipeEntity recipe) = _Save;

  const factory RecipeEvent.get() = _Get;

  const factory RecipeEvent.delete(RecipeEntity recipe) = _Delete;

  const factory RecipeEvent.edit(
    RecipeEntity recipe,
    RecipeEntity newRecipe,
  ) = _Edit;
}
