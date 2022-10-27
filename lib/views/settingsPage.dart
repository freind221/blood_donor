import 'package:blood_donor/providers/dropdown_provider.dart';
import 'package:blood_donor/resources/firestore_methods.dart';
import 'package:blood_donor/utilis/widgets/custom_button.dart';
import 'package:blood_donor/utilis/widgets/dropdown.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utilis/message.dart';

class SettingsPage extends StatefulWidget {
  static String routeName = '/settings';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FireStoreMethods storeMethods = FireStoreMethods();
  Uint8List? image;

  settingProfile(String gender, String bloodGroup) {
    Message.toatsMessage("Creating Meeting For you");
    storeMethods
        .updatingProfile(gender, image, context, bloodGroup)
        .then((value) {
      Message.toatsMessage('Saved Successfully');
    }).onError((error, stackTrace) {
      Message.toatsMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final dropdown = Provider.of<DropDownProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  Uint8List? file =
                      await Message.pickImage().onError((error, stackTrace) {
                    Message.toatsMessage(error.toString());
                  });

                  if (file != null) {
                    setState(() {
                      image = file;
                    });
                  }
                },
                child: ClipOval(
                  child: CircleAvatar(
                    radius: 50,
                    child: image != null
                        ? Image.memory(
                            image!,
                            fit: BoxFit.cover,
                            width: 100.0,
                            height: 100.0,
                          )
                        : Image.network(
                            'https://media.gettyimages.com/photos/shah-faisal-masjid-islamabad-pakistan-picture-id912853916?s=612x612',
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: CustomDropDown(
                  items: ['Male', 'Female', 'Other'],
                  title: 'Select your gender',
                  check: 'Gender',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: CustomDropDown(
                  items: ['A', 'A+', 'B', 'B+', 'C', 'C+', 'AB+', 'O+', 'O-'],
                  title: 'Select your BloodGroup',
                  check: 'BloodGroup',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: CustomButton(
                    onTap: () {
                      settingProfile(dropdown.gender, dropdown.bloodGroup);
                    },
                    text: 'Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
