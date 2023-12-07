import 'package:flutter_testing/data/model/count_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _sharedPreferences;
  final String _COUNTKEY = "COUNT_KEY";

  SharedPreferencesService({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;


  CountDTO getSharedPrefrences (){
   final result =  _sharedPreferences.getInt(_COUNTKEY) ??  0;
   return CountDTO(count: result);
  }

  Future<bool> setSharedPrefrences(CountDTO model)async{
   return await _sharedPreferences.setInt(_COUNTKEY, model.count);
  }

}
