import 'package:flutter/material.dart';

class GenderDropdown extends StatefulWidget {
  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String selectedGender = 'Male'; // Initialize selectedGender with a default value

  @override
  Widget build(BuildContext context) {
    return
      DropdownButton<String>(
      value: selectedGender,
      onChanged: (String? newValue) { // Update the parameter type to nullable
        if(newValue != null) { // Check for nullability
          setState(() {
            selectedGender = newValue;
          });
        }
      },
      items: <String>['Male', 'Female'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
