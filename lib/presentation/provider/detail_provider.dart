import 'package:diatfori/data/model/resep_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/constant.dart';
import '../../data/api/api_service.dart';


class DetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String keyResep;
  
  DetailProvider({required this.apiService, required this.keyResep}) {
     fetchDetail(keyResep);
  }

  late ResepDetail _resepResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  ResepDetail get result => _resepResult;
  ResultState get state => _state;

  Future<dynamic> fetchDetail(String keyResep) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final result = await apiService.getResepDetail(keyResep);
      if (result.results.title.isEmpty) {
        _state = ResultState.noData;
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _resepResult = result;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection';
    }
  }
}
