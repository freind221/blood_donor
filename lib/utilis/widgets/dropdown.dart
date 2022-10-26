import 'package:blood_donor/providers/dropdown_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  final String title;
  final String check;
  const CustomDropDown(
      {super.key,
      required this.items,
      required this.title,
      required this.check});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  //final List<String> items = ['Donor', 'Acceptor', 'Admin'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final dropDown = Provider.of<DropDownProvider>(context);
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        hint: Text(
          widget.title,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please Select Your Role.';
          }
          return null;
        },
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
            if (widget.check == 'Role') {
              dropDown.setRole(selectedValue!);
            } else if (widget.check == 'Gender') {
              dropDown.setGender(selectedValue!);
            }
          });
        },
        buttonHeight: 40,
        buttonWidth: 140,
        itemHeight: 40,
      ),
    );
  }
}
