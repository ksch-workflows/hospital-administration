import 'package:flutter/material.dart';
import 'package:registration/util/form_stepper.dart';

class PersonalDataFormStep implements FormStep {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController;
  final TextEditingController fatherNameController;

  PersonalDataFormStep({
    this.nameController,
    this.fatherNameController,
  });

  @override
  String get title => "Personal data";

  @override
  Widget get body {
    return Form(
      key: formKey,
      child: Column(children: <Widget>[
        TextFormField(
          controller: nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "The patient's name is required information.";
            }
            return null;
          },
          decoration: InputDecoration(
              labelText: "Patient's name*",
              border: const OutlineInputBorder(),
              hintText: "Please enter the patient's name",
              helperText: "* Required"),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: fatherNameController,
          decoration: InputDecoration(
            labelText: "Father's name",
            border: const OutlineInputBorder(),
            hintText: "Please enter the patient father's name, if applicable",
          ),
        ),
      ]),
    );
  }

  @override
  bool validate() {
    return true;
  }
}
