import 'package:flutter/material.dart';

import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';
import 'package:recipe_sql/feat/recipes/presentation/screens/recipe_info.dart';
import 'package:recipe_sql/feat/recipes/presentation/widgets/recipe_cache_image.dart';

class RecipeCard extends StatelessWidget {
  final RecipeEntity recipe;
  final int index;

  const RecipeCard(this.recipe, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeInfo(recipe, index),
            ),
          );
        },
        child: Ink(
          decoration: const BoxDecoration(color: Colors.white),
          child: SizedBox(
            child: Column(
              children: [
                Hero(
                  tag: '${recipe.image}$index',
                  child: RecipeCacheImage(
                    recipe.image,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 15),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    recipe.label,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text('${recipe.calories.round()} Kcal'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
