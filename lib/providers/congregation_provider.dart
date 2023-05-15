import 'package:flutter/material.dart';
import 'package:min_assist/models/congregation.dart';
import 'package:min_assist/models/territory.dart';

class CongregationProvider extends ChangeNotifier {
  Congregation? _congregation;

  Congregation? get congregation => _congregation;

  set congregation(Congregation? congregation) {
    _congregation = congregation;
    notifyListeners();
  }
  List<Territory> get territories {
    return _congregation?.territories ?? [];
  }
}