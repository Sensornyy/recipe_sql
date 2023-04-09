part of 'recipe_bloc.dart';

@freezed
class RecipeEvent with _$RecipeEvent {
  const factory RecipeEvent.load(String query) = _Load;

  const factory RecipeEvent.save(RecipeEntity recipe) = _Save;
}
