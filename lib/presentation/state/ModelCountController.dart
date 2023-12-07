import 'package:flutter/material.dart';
import 'package:flutter_testing/domain/model/count_model.dart';
import 'package:flutter_testing/domain/repository/count_repository.dart';

class ModelCountController with ChangeNotifier {
  final CountRepository _countRepository;
  int _count = 0;

  int get getCount => _count;

  List<int> _countList = [];

  List<int> get getCountList => _countList;

  ModelCountController(this._countRepository) {
    _count = _countRepository.getCountModel().count;
  }

  void onIncrementCount() async {
    _count++;
    _countList.add(_count);
    await _countRepository.setCountModel(CountModel(count: _count));
    notifyListeners();
  }

  void onDecrementCount() async {
    _count--;
    _countList.add(_count);
    await _countRepository.setCountModel(CountModel(count: _count));
    notifyListeners();
  }
}
