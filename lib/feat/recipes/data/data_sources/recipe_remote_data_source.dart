import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:recipe_sql/feat/recipes/data/model/recipe_model.dart';

abstract class RecipeRemoteDataSource {
  Future<List<RecipeModel>> loadRecipes(String query);
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final http.Client client;

  RecipeRemoteDataSourceImpl(this.client);

  @override
  Future<List<RecipeModel>> loadRecipes(String query) async {
    final response = await client.get(
        Uri.parse(
            'https://api.edamam.com/search?q=$query&app_id=5407434a&app_key=85ff6e56fe1beccebaa69980a095686d'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final recipes = json.decode(response.body);

      return (recipes['hits'] as List)
          .map((recipe) => RecipeModel.fromJson(recipe['recipe']))
          .toList();
    } else {
      throw Exception();
    }
  }
}
