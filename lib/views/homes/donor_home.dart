import 'package:blood_donor/providers/user_provider.dart';
import 'package:blood_donor/resources/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonorHome extends StatefulWidget {
  static String routeName = '/home';
  const DonorHome({super.key});

  @override
  State<DonorHome> createState() => _DonorHomeState();
}

class _DonorHomeState extends State<DonorHome> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
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
      body: Center(child: Text(userProvider.user.role)),
    );
  }
}
