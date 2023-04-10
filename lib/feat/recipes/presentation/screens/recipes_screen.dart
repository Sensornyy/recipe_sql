import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:recipe_sql/feat/recipes/presentation/bloc/recipe_bloc.dart';
import 'package:recipe_sql/di_container/service_locator.dart' as di;
import 'package:recipe_sql/feat/recipes/presentation/screens/favourites_screen.dart';
import 'package:recipe_sql/feat/recipes/presentation/widgets/recipes_list.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeBloc>(
      create: (context) => di.sl<RecipeBloc>()
        ..add(
          const RecipeEvent.load('salad'),
        ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: const Text('Recipe SQL'),
          actions: [
            IconButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavouritesScreen(),
                ),
              );
            }, icon: const Icon(Icons.favorite)),
          ],
        ),
        body: const RecipesList(),
      ),
    );
  }
}
