import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_sql/di_container/service_locator.dart' as di;
import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';
import 'package:recipe_sql/feat/recipes/domain/use_case/load_recipes_use_case.dart';

part 'recipe_event.dart';

part 'recipe_state.dart';

part 'recipe_bloc.freezed.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final LoadRecipesUseCase loadRecipe = di.sl<LoadRecipesUseCase>();

  RecipeBloc() : super(const RecipeState.initial()) {
    on<RecipeEvent>((event, emit) async {
      await event.when(
        load: (String query) async {
          emit(const RecipeState.loading());

          final result = await loadRecipe(query);

          if (result.runtimeType == List<RecipeEntity>) {
            emit(RecipeState.loaded(result));
          } else {
            emit(const RecipeState.failed());
          }
        },
      );
    });
  }
}
