import 'package:recipe_sql/feat/recipes/data/data_sources/recipe_local_data_source.dart';
import 'package:recipe_sql/feat/recipes/data/data_sources/recipe_remote_data_source.dart';
import 'package:recipe_sql/feat/recipes/data/model/recipe_model.dart';
import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';
import 'package:recipe_sql/feat/recipes/domain/repository/recipe_repository.dart';
import 'package:recipe_sql/platform/network_info.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final NetworkInfo networkInfo;
  final RecipeRemoteDataSource remoteDataSource;
  final RecipeLocalDataSource localDataSource;

  RecipeRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<RecipeEntity>> loadRecipes(String query) async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.loadRecipes(query);
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> saveRecipe(RecipeEntity recipe) async {
    try {
      await localDataSource.saveRecipe(recipe as RecipeModel);
    } catch (e) {
      throw Exception(e);
    }
  }
}
