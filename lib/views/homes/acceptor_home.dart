import 'package:blood_donor/providers/user_provider.dart';
import 'package:blood_donor/resources/firebase_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcceptorHome extends StatelessWidget {
  static String routeName = '/acceptor';
  const AcceptorHome({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acceptor'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              AuthMethods().logout(context);
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.black,
            )),
      ),
      body: Center(
        child: Text(userProvider.user.role),
      ),
    );
  }
}
