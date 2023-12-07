import 'package:flutter_testing/data/model/count_dto.dart';

import '../../domain/model/count_model.dart';

extension CountDTOMapper on CountDTO {
  CountModel toEntity() {
    return CountModel(
      count: count,
    );
  }
}
extension CountModelMapper on CountModel {
  CountDTO toEntity() {
    return CountDTO(
      count: count,
    );
  }
}

