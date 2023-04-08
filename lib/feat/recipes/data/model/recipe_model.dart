import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';

part 'recipe_model.freezed.dart';

part 'recipe_model.g.dart';

@freezed
class RecipeModel extends RecipeEntity with _$RecipeModel {
  const factory RecipeModel({
    required String label,
    required int calories,
    required String image,
    required List<String> ingredientLines,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, Object?> json) =>
      _$RecipeModelFromJson(json);
}