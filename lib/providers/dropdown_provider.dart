import 'package:flutter/cupertino.dart';

class DropDownProvider extends ChangeNotifier {
  String _role = '';

  setRole(String rol) {
    _role = rol;
    notifyListeners();
  }

  String get role => _role;
}
