import 'package:flutter/cupertino.dart';

class DropDownProvider extends ChangeNotifier {
  String _role = '';
  String _gender = '';

  setRole(String rol) {
    _role = rol;
    notifyListeners();
  }

  setGender(String rol) {
    _gender = rol;
    notifyListeners();
  }

  String get role => _role;
  String get gender => _gender;
}
