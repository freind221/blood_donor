import 'package:flutter/cupertino.dart';

class DropDownProvider extends ChangeNotifier {
  String _role = '';
  String _gender = '';
  String _bloodGroup = '';

  setRole(String rol) {
    _role = rol;
    notifyListeners();
  }

  setGender(String rol) {
    _gender = rol;
    notifyListeners();
  }

  setBloodGroup(String rol) {
    _bloodGroup = rol;
    notifyListeners();
  }

  String get role => _role;
  String get gender => _gender;
  String get bloodGroup => _bloodGroup;
}
