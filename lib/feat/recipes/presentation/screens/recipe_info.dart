import 'package:flutter/material.dart';

import 'package:recipe_sql/di_container/service_locator.dart' as di;
import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';
import 'package:recipe_sql/feat/recipes/presentation/bloc/recipe_bloc.dart';
import 'package:recipe_sql/feat/recipes/presentation/widgets/recipe_cache_image.dart';

class RecipeInfo extends StatelessWidget {
  final RecipeEntity recipe;

  const RecipeInfo(this.recipe, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipeBloc = di.sl<RecipeBloc>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 350,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: null,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 20.0,
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.edit,
                                    size: 28,
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'Edit',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              recipeBloc.add(
                                RecipeEvent.save(recipe),
                              );

                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 20.0,
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.favorite,
                                    size: 28,
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'Save',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: null,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 20.0,
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.delete,
                                    size: 28,
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'Delete',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            icon: const Icon(
              Icons.more_horiz_outlined,
            ),
          )
        ],
        title: Text(
          recipe.label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: recipe.image,
              child: RecipeCacheImage(
                recipe.image,
                width: double.infinity,
                height: 400,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    '- ${recipe.ingredientLines[index]}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  itemCount: recipe.ingredientLines.length,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${recipe.calories.round()} Kcal',
                    style: const TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
