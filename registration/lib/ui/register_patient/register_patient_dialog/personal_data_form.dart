import 'package:flutter/material.dart';
import 'package:registration/util/form_stepper.dart';

class PersonalDataFormStep implements FormStep {
  final TextEditingController nameController;

  PersonalDataFormStep({this.nameController});

  @override
  String get title => "Personal data";

  @override
  Widget get body => Column(
        children: [
          TextField(
            controller: nameController,
          )
        ],
      );

  @override
  bool validate() {
    return true;
  }
}
