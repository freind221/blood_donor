import 'package:blood_donor/models/user_model.dart';
import 'package:blood_donor/models/user_profile_model.dart';
import 'package:flutter/cupertino.dart';

class UserProfileProvider extends ChangeNotifier {
  UserProfile _profile = UserProfile(uid: '', image: '', gender: '');

  UserProfile get profile => _profile;
  setUser(UserProfile profile) {
    _profile = profile;
    notifyListeners();
  }
}
