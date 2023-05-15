import 'package:min_assist/models/territory.dart';

class Congregation {
  final String name;
  final List<Territory> territories;
  String? _id; //private _id  property

  Congregation({required this.name, this.territories = const [], String? id})
      : _id = id;

  String? get id => _id; //getter for id property
  void setId(String? value) {
    _id = value;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'territories': territories.map((t) => t.toJson()).toList(),
      '_id': _id, // include the private _id property in the JSON output
    };
  }
}
