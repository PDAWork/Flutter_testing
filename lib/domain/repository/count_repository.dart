import 'package:flutter_testing/domain/model/count_model.dart';

abstract interface class CountRepository{
  CountModel getCountModel();
  Future<bool> setCountModel(CountModel model);
}