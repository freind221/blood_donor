import 'dart:typed_data';

import 'package:blood_donor/utilis/message.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  uploadImageToSource(String childName, Uint8List file, String uid) async {
    //Reference ref = _storage.ref().child(childName).child(uid);
    var stringUrl = '';
    try {
      Reference reference = FirebaseStorage.instance
          .ref('/FolderImages${DateTime.now().millisecondsSinceEpoch}');
      UploadTask uploadTask =
          reference.putData(file, SettableMetadata(contentType: 'image/jpg'));
      TaskSnapshot snapshot = await uploadTask;
      stringUrl = await snapshot.ref.getDownloadURL();
      
    } catch (e) {
      Message.toatsMessage(e.toString());
    }
    return stringUrl;
  }
}
