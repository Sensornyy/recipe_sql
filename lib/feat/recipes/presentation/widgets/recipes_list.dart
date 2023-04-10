import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';
import 'package:recipe_sql/feat/recipes/presentation/bloc/recipe_bloc.dart';
import 'package:recipe_sql/feat/recipes/presentation/widgets/loading_indicator.dart';
import 'package:recipe_sql/feat/recipes/presentation/widgets/recipes_card.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        List<RecipeEntity> recipes = [];

        state.maybeWhen(
          loaded: (loadedRecipes) {
            recipes = loadedRecipes;
          },
          failed: () {
            return const Text('Something went wrong');
          },
          orElse: () {
            return const LoadingIndicator();
          },
        );

        return Padding(
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
        );
      },
    );
  }
}
