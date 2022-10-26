import 'package:blood_donor/resources/firestore_methods.dart';
import 'package:blood_donor/utilis/message.dart';
import 'package:blood_donor/utilis/widgets/custom_button.dart';
import 'package:blood_donor/utilis/widgets/dropdown.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dropdown_provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final FireStoreMethods storeMethods = FireStoreMethods();
  Uint8List? image;

  liveStreamMeeting(String gender) {
    Message.toatsMessage("Creating Meeting For you");
    storeMethods.updatingProfile(gender, image, context).then((value) {
      Message.toatsMessage('Saved Successfully');
    }).onError((error, stackTrace) {
      Message.toatsMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final dropDown = Provider.of<DropDownProvider>(context);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
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
              child: CircleAvatar(
                child: image != null
                    ? Image.memory(image!)
                    : Image.network(
                        'https://media.gettyimages.com/photos/shah-faisal-masjid-islamabad-pakistan-picture-id912853916?s=612x612'),
              ),
            ),
            const CustomDropDown(
              items: ['Male', 'Female', 'Other'],
              title: 'Select your gender',
              check: 'Gender',
            ),
            CustomButton(
                onTap: () {
                  liveStreamMeeting(dropDown.gender);
                },
                text: 'Save')
          ],
        ),
      ),
    );
  }
}
