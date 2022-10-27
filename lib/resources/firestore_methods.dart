import 'dart:typed_data';

import 'package:blood_donor/models/user_profile_model.dart' as model;
import 'package:blood_donor/providers/profile_provider.dart';
import 'package:blood_donor/providers/user_provider.dart';
import 'package:blood_donor/resources/storage_method.dart';
import 'package:blood_donor/utilis/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FireStoreMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final StorageMethods storageMethods = StorageMethods();
  final _firestore = FirebaseFirestore.instance;
  Future<Map<String, dynamic>?> getCurrentUser(
      String? uid, BuildContext context) async {
    if (uid != null) {
      final providerUser = Provider.of<UserProvider>(context, listen: false);
      final snap = await _firestore
          .collection('userProfile')
          .doc("${providerUser.user.uid}${providerUser.user.username}")
          .get();

      // Here we are gonna get the data from user that we stored in snap variable

      return snap.data();
    }
    return null;
  }

  setToProvider(BuildContext context) async {
    Provider.of<UserProfileProvider>(context, listen: false).setUser(
        model.UserProfile.fromMap(
            await getCurrentUser(_auth.currentUser!.uid, context) ?? {}));
  }

  Future updatingProfile(String gender, Uint8List? file, BuildContext context,
      String bloodGroup) async {
    final providerUser = Provider.of<UserProvider>(context, listen: false);
    final userProfiile =
        Provider.of<UserProfileProvider>(context, listen: false);
    try {
      var url = await storageMethods.uploadImageToSource(
          'profilePic', file!, providerUser.user.uid);

      final String channelId =
          "${providerUser.user.uid}${providerUser.user.username}";
      if (_auth.currentUser != null) {
        model.UserProfile userProfile = model.UserProfile(
            uid: channelId, image: url, gender: gender, bloodGroup: bloodGroup);
        userProfiile.setUser(userProfile);
        _firestore
            .collection('userProfile')
            .doc(channelId)
            .set(userProfile.toMap())
            .then((value) {})
            .onError((error, stackTrace) {
          Message.toatsMessage('Something went wrong');
        });
      }
    } catch (e) {
      Message.toatsMessage(e.toString());
    }
  }
}
