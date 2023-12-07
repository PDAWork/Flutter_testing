import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/domain/model/count_model.dart';
import 'package:flutter_testing/domain/repository/count_repository.dart';
import 'package:flutter_testing/presentation/state/ModelCountController.dart';

class FakeSharedPreferences implements CountRepository {
  CountModel model = CountModel(count: 0);

  @override
  CountModel getCountModel() {
    return model;
  }

  @override
  Future<bool> setCountModel(CountModel model) async {
    model = model;
    return true;
  }
}

void main() {
  test('Test Count Model', () async {
    final modelCountController = ModelCountController(FakeSharedPreferences());

    expect(
      modelCountController.getCountList.length,
      1,
      reason: "Проверка размера массива",
    );

    modelCountController.onIncrementCount();
    expect(modelCountController.getCount, 1);

    expect(modelCountController.getCountList.length, 1);

    modelCountController.onDecrementCount();
    expect(modelCountController.getCount, 0);

    expect(modelCountController.getCountList.length, 2);
  });
}
