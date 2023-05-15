class User {
  final String _uid;
  final String _email;
  final String _displayName;

  User({
    required String uid,
    required String email,
    required String displayName,
    required String photoURL,
  })  : _uid = uid,
        _email = email,
        _displayName = displayName;

  String get uid => _uid;
  String get email => _email;
  String get displayName => _displayName;
}
