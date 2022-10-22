// import 'package:blood_donor/views/homes/acceptor_home.dart';
// import 'package:blood_donor/views/homes/donor_home.dart';
// import 'package:blood_donor/views/homes/admin_home.dart';
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
}
