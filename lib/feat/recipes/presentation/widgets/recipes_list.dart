import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:recipe_sql/di_container/service_locator.dart' as di;
import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';
import 'package:recipe_sql/feat/recipes/presentation/bloc/recipe_bloc.dart';
import 'package:recipe_sql/feat/recipes/presentation/widgets/loading_indicator.dart';
import 'package:recipe_sql/feat/recipes/presentation/widgets/recipes_card.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di.sl<RecipeBloc>()..add(const RecipeEvent.load('salad')),
      child: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          List<RecipeEntity> recipes = [];

          state.maybeWhen(loaded: (loadedRecipes) {
            recipes = loadedRecipes;
          }, orElse: () {
            return const LoadingIndicator();
          });

          return BlocListener<RecipeBloc, RecipeState>(
            listener: (context, state) {
              state.maybeWhen(
                deleted: (recipe) {
                  recipes.removeWhere((r) => r.label == recipe.label);
                },
                loaded: (loadedRecipes) {
                  recipes = loadedRecipes;
                },
                failed: () {
                  return const Text('Something went wron33g');
                },
                orElse: () {
                  return const LoadingIndicator();
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: recipes.length,
                itemBuilder: (BuildContext ctx, index) {
                  return RecipeCard(recipes[index], index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
