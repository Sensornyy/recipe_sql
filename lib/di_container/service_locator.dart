import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:recipe_sql/feat/recipes/data/data_sources/recipe_remote_data_source.dart';
import 'package:recipe_sql/feat/recipes/data/repository/recipe_repository_impl.dart';
import 'package:recipe_sql/feat/recipes/domain/repository/recipe_repository.dart';
import 'package:recipe_sql/feat/recipes/domain/use_case/load_recipes_use_case.dart';
import 'package:recipe_sql/feat/recipes/presentation/bloc/recipe_bloc.dart';
import 'package:recipe_sql/platform/network_info.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => RecipeBloc());
  sl.registerLazySingleton(() => LoadRecipesUseCase(sl()));

  sl.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSourceImpl(http.Client()),
  );

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
