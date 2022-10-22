import 'package:blood_donor/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(uid: '', username: '', email: '', role: 'nothing');

  User get user => _user;
  setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
