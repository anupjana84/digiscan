import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  String email = "";
  String get _email => email;
  void setUserEmail(value) {
    email = value;
    notifyListeners();
  }
}
