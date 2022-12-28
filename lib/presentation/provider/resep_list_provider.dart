import 'dart:async';
import 'package:flutter/material.dart';
import 'package:diatfori/common/constant.dart';
import 'package:diatfori/data/api/api_service.dart';
import 'package:diatfori/data/model/resep_list.dart';

class ResepListProvider extends ChangeNotifier {
  final ApiService apiService;

  ResepListProvider({required this.apiService}) {
    _fetchAllRecipes();
  }

  late Reseplist _articlesResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;


  Reseplist get result => _articlesResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRecipes() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final article = await apiService.topHeadlines();
      if (article.results.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _articlesResult = article;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

