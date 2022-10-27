import 'package:blood_donor/models/user_profile_model.dart';
import 'package:blood_donor/providers/profile_provider.dart';
import 'package:blood_donor/providers/user_provider.dart';
import 'package:blood_donor/resources/firebase_methods.dart';
import 'package:blood_donor/resources/firestore_methods.dart';
import 'package:blood_donor/utilis/message.dart';

import 'package:blood_donor/views/homes/donor_home.dart';
import 'package:blood_donor/views/settingsPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

String? image;

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userProfile = Provider.of<UserProfileProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipOval(
              child: CircleAvatar(
                child: userProfile.profile.image != null &&
                        userProfile.profile.image != ''
                    ? Image.network(
                        userProfile.profile.image!,
                        fit: BoxFit.cover,
                        width: 90.0,
                        height: 90.0,
                      )
                    : Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU',
                        fit: BoxFit.cover,
                        width: 90.0,
                        height: 90.0,
                      ),
              ),
            ),
            accountEmail: Text(userProvider.user.email),
            accountName: Text(
              userProvider.user.username,
              style: const TextStyle(fontSize: 24.0),
            ),
            decoration: const BoxDecoration(
              color: Colors.black87,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.house),
            title: const Text(
              'Houses',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const DonorHome(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.apartment),
            title: const Text(
              'Apartments',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const DonorHome(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.pushNamed(context, SettingsPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'SignOut',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              AuthMethods().logout(context);
            },
          ),
        ],
      ),
    );
  }
}
