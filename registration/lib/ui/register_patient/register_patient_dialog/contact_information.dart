import 'package:flutter/material.dart';
import 'package:registration/util/form_stepper.dart';

class ContactInformationFormStep implements FormStep {
  final formKey = GlobalKey<FormState>();

  final TextEditingController locationController;

  ContactInformationFormStep({this.locationController});

  @override
  String get title => "Contact information";

  @override
  Widget get body {
    return Form(
      key: formKey,
      child: Column(children: <Widget>[
        TextFormField(
          controller: locationController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "The patient's location is required information.";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Patient's location*",
            border: const OutlineInputBorder(),
            hintText: "Please enter the patient's location",
            helperText: "* Required",
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
