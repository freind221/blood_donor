import 'package:blood_donor/providers/dropdown_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final List<String> items = ['Donor', 'Acceptor', 'Admin'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final dropDown = Provider.of<DropDownProvider>(context);
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        hint: Text(
          'Select your role',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items
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
            dropDown.setRole(selectedValue!);
          });
        },
        buttonHeight: 40,
        buttonWidth: 140,
        itemHeight: 40,
      ),
    );
  }
}
