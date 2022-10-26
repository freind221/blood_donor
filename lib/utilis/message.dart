// import 'package:blood_donor/views/homes/acceptor_home.dart';
// import 'package:blood_donor/views/homes/donor_home.dart';
// import 'package:blood_donor/views/homes/admin_home.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Message {
  static toatsMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  // static checkRoll(String role) {
  //   if (role == 'Acceptor') {
  //     return const AcceptorHome();
  //   }
  //   if (role == 'Donor') {
  //     return const DonorHome();
  //   }
  //   if (role == 'Admin') {
  //     return const AdminHome();
  //   }
  // }
  static Future pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    try {
      if (result != null) {
        if (kIsWeb) {
          Uint8List fileBytes = result.files.single.bytes!;
          return fileBytes;
        }
        Uint8List file = await File(result.files.single.path!).readAsBytes();
        return file;
      }
    } catch (e) {
      Message.toatsMessage(e.toString());
    }
  }
}
