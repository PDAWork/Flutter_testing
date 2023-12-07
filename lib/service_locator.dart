import 'package:flutter_testing/data/repository/count_repository_impl.dart';
import 'package:flutter_testing/data/service/shared_preferences_service.dart';
import 'package:flutter_testing/domain/repository/count_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  final preferences = await SharedPreferences.getInstance();

  // State Managment

  //Repository

  sl.registerLazySingleton<CountRepository>(
    () => CountRepositoryImpl(
      sharedPreferencesService: sl(),
    ),
  );

  //Data

  sl.registerLazySingleton(
    () => SharedPreferencesService(
      sharedPreferences: sl(),
    ),
  );
  // Lib

  sl.registerLazySingleton(() => preferences);
}
