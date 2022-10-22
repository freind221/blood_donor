import 'package:blood_donor/resources/firebase_methods.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  static String routeName = '/admin';
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              AuthMethods().logout(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            )),
      ),
      body: const Center(
        child: Text('Admin Page'),
      ),
    );
  }
}
