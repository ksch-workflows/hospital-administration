import 'package:flutter/material.dart';
import 'package:registration/core/patient/patient.dart';
import 'package:registration/ui/register_patient/register_patient_dialog/contact_information.dart';
import 'package:registration/ui/register_patient/register_patient_dialog/personal_data.dart';
import 'package:registration/ui/register_patient/register_patient_dialog/visit_type.dart';

import 'package:registration/util/form_stepper.dart';
import 'package:registration/util/singleton_bucket.dart';

class RegisterPatientResult {
  final Patient patient;
  final String visitType;

  RegisterPatientResult({
    @required this.patient,
    @required this.visitType,
  })  : assert(patient != null),
        assert(visitType != null);
}

class RegisterPatientDialog extends StatefulWidget {
  final Function onDialogClose;

  RegisterPatientDialog({
    @required this.onDialogClose,
  }) : assert(onDialogClose != null);

  @override
  State<StatefulWidget> createState() => _RegisterPatientDialogState();
}

class _RegisterPatientDialogModel {
  final visitTypeSelection = FormValue<String>();
  final nameController = TextEditingController();
  final fatherNameController = TextEditingController();
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
        fatherNameController: _model.fatherNameController,
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
            onCancel: cancel,
            onSave: save,
          ),
        ),
      ],
    );
  }

  void save() {
    var newPatient = Patient(
      name: _model.nameController.text,
      fatherName: _model.fatherNameController.text,
      location: _model.locationController.text,
    );
    var result = RegisterPatientResult(
      patient: newPatient,
      visitType: _model.visitTypeSelection.value,
    );

    SingletonBucket.reset<_RegisterPatientDialogModel>();
    widget.onDialogClose(result);
  }

  void cancel() {
    SingletonBucket.reset<_RegisterPatientDialogModel>();
    widget.onDialogClose(null);
  }
}
