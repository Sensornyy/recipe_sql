import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:recipe_sql/di_container/service_locator.dart' as di;
import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';
import 'package:recipe_sql/feat/recipes/domain/use_case/delete_recipe_use_case.dart';
import 'package:recipe_sql/feat/recipes/domain/use_case/get_recipes.dart';
import 'package:recipe_sql/feat/recipes/domain/use_case/load_recipes_use_case.dart';
import 'package:recipe_sql/feat/recipes/domain/use_case/save_recipe_use_case.dart';

part 'recipe_event.dart';

part 'recipe_state.dart';

part 'recipe_bloc.freezed.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final LoadRecipesUseCase loadRecipe = di.sl<LoadRecipesUseCase>();
  final SaveRecipeUseCase saveRecipe = di.sl<SaveRecipeUseCase>();
  final GetRecipesUseCase getRecipes = di.sl<GetRecipesUseCase>();
  final DeleteRecipeUseCase deleteRecipes = di.sl<DeleteRecipeUseCase>();

  RecipeBloc() : super(const RecipeState.initial()) {
    on<RecipeEvent>((event, emit) async {
      await event.when(
        load: (String query) async {
          emit(const RecipeState.loading());

          final result = await loadRecipe(query);

          emit(RecipeState.loaded(result));
        },
        save: (RecipeEntity recipe) async {
          await saveRecipe(recipe);

          emit(const RecipeState.saved());
        },
        get: () async {
          emit(const RecipeState.loading());

          final result = await getRecipes();

          emit(RecipeState.loaded(result));
        },
        delete: (RecipeEntity recipe) async {
          emit(const RecipeState.loading());

          await deleteRecipes(recipe);

          emit(RecipeState.deleted(recipe));
        },
      );
    });
  }
}
