import 'package:recipe_sql/feat/recipes/data/data_sources/recipe_remote_data_source.dart';
import 'package:recipe_sql/feat/recipes/domain/entity/recipe_entity.dart';
import 'package:recipe_sql/feat/recipes/domain/repository/recipe_repository.dart';
import 'package:recipe_sql/platform/network_info.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final NetworkInfo networkInfo;
  final RecipeRemoteDataSource remoteDataSource;

  RecipeRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<List<RecipeEntity>> loadRecipes(String query) async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.loadRecipes(query);
    } else {
      throw Exception();
    }
  }
}
