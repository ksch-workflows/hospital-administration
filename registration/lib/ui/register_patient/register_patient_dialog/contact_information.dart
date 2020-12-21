import 'package:flutter/material.dart';
import 'package:registration/util/form_stepper.dart';

class ContactInformationFormStep implements FormStep {
  final TextEditingController locationController;

  ContactInformationFormStep({this.locationController});

  @override
  String get title => "Contact information";

  @override
  Widget get body => Column(
    children: [
      TextField(
        controller: locationController,
      )
    ],
  );

  @override
  bool validate() {
    return true;
  }
}
