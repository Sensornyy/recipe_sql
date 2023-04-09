part of 'recipe_bloc.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState.initial() = _Initial;

  const factory RecipeState.loading() = _Loading;

  const factory RecipeState.loaded(List<RecipeEntity> recipes) = _Loaded;

  const factory RecipeState.failed() = _Failed;
}
