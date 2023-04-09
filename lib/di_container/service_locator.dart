import 'package:get_it/get_it.dart';
import 'package:path/path.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:recipe_sql/feat/recipes/data/data_sources/recipe_local_data_source.dart';

import 'package:recipe_sql/feat/recipes/data/data_sources/recipe_remote_data_source.dart';
import 'package:recipe_sql/feat/recipes/data/repository/recipe_repository_impl.dart';
import 'package:recipe_sql/feat/recipes/domain/repository/recipe_repository.dart';
import 'package:recipe_sql/feat/recipes/domain/use_case/load_recipes_use_case.dart';
import 'package:recipe_sql/feat/recipes/domain/use_case/save_recipe_use_case.dart';
import 'package:recipe_sql/feat/recipes/presentation/bloc/recipe_bloc.dart';
import 'package:recipe_sql/platform/network_info.dart';
import 'package:sqflite/sqflite.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => RecipeBloc());

  sl.registerLazySingleton(() => LoadRecipesUseCase(sl()));

  sl.registerLazySingleton(() => SaveRecipeUseCase(sl()));

  sl.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<RecipeLocalDataSource>(
    () => RecipeLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());

  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'recipe.db');

  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE recipes (id INTEGER PRIMARY KEY AUTOINCREMENT, label TEXT, calories DOUBLE, image TEXT, ingredientLines TEXT)');
  });

  sl.registerSingletonAsync<Database>(() async => database);
}
