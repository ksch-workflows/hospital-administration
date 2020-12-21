import 'package:flutter/material.dart';
import 'package:registration/ui/register_patient/register_patient_dialog/contact_information.dart';
import 'package:registration/ui/register_patient/register_patient_dialog/personal_data.dart';
import 'package:registration/ui/register_patient/register_patient_dialog/visit_type.dart';

import 'package:registration/util/form_stepper.dart';
import 'package:registration/util/form_value.dart';
import 'package:registration/util/singleton_bucket.dart';

class RegisterPatientDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPatientDialogState();
}

class _RegisterPatientDialogModel {
  final visitTypeSelection = FormValue<String>();
  final nameController = TextEditingController();
  final locationController = TextEditingController();
}

class _RegisterPatientDialogState extends State<RegisterPatientDialog> {
  final _model = SingletonBucket.get(() => _RegisterPatientDialogModel());

  List<FormStep> _steps;

  @override
  void initState() {
    super.initState();

    _steps = [
      PersonalDataFormStep(
        nameController: _model.nameController,
      ),
      ContactInformationFormStep(
        locationController: _model.locationController,
      ),
      VisitTypeFormStep(
        visitTypeSelection: _model.visitTypeSelection,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Register patient"),
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.tight(Size(800, 400)),
          child: FormStepper(
            steps: _steps,
          ),
        ),
      ],
    );
  }
}
