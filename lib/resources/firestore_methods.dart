import 'dart:typed_data';

import 'package:blood_donor/models/user_profile_model.dart';
import 'package:blood_donor/providers/user_provider.dart';
import 'package:blood_donor/resources/storage_method.dart';
import 'package:blood_donor/utilis/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FireStoreMethods {
  final StorageMethods storageMethods = StorageMethods();
  final _firestore = FirebaseFirestore.instance;
  Future updatingProfile(
      String gender, Uint8List? file, BuildContext context) async {
    String channelID = '';
    final providerUser = Provider.of<UserProvider>(context, listen: false);
    try {
      var url = await storageMethods.uploadImageToSource(
          'profilePic', file!, providerUser.user.uid);
      print('-------------------------$file');
      final String channelId =
          "${providerUser.user.uid}${providerUser.user.username}";
      channelID = channelId;
      UserProfile userProfile =
          UserProfile(uid: channelId, image: url, gender: gender);
      _firestore
          .collection('userProfile')
          .doc(channelId)
          .set(userProfile.toMap())
          .then((value) {})
          .onError((error, stackTrace) {
        Message.toatsMessage('Something went wrong');

        channelID = '';
      });
    } catch (e) {
      Message.toatsMessage(e.toString());
    }
  }
}
