import 'package:flutter_testing/data/mapper/count_mapper.dart';
import 'package:flutter_testing/data/service/shared_preferences_service.dart';
import 'package:flutter_testing/domain/model/count_model.dart';
import 'package:flutter_testing/domain/repository/count_repository.dart';

class CountRepositoryImpl implements CountRepository {
  final SharedPreferencesService sharedPreferencesService;

  CountRepositoryImpl({required this.sharedPreferencesService});

  @override
  CountModel getCountModel() {
    return sharedPreferencesService.getSharedPrefrences().toEntity();
  }

  @override
  Future<bool> setCountModel(CountModel model) async {
    return await sharedPreferencesService.setSharedPrefrences(model.toEntity());
  }
}
