import 'package:flutter/material.dart';

import 'package:registration/ui/register_patient/register_patient_dialog/form_stepper.dart';
import 'package:registration/util/singleton_bucket.dart';


class _RegisterPatientDialogModel {
  final visitTypeSelection = FormValue<String>();
  final nameController = TextEditingController();
}

/// Intended for usage with, e.g.
/// - https://api.flutter.dev/flutter/material/Checkbox-class.html
/// - https://api.flutter.dev/flutter/material/Switch-class.html
/// - https://api.flutter.dev/flutter/material/Radio-class.html
class FormValue<T> {
  T value;
}

class RegisterPatientDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPatientDialogState();
}

class _RegisterPatientDialogState extends State<RegisterPatientDialog> {
  List<FormStep> _steps;
  final _registerPatientDialogModel = SingletonBucket.get(() => _RegisterPatientDialogModel());

  @override
  void initState() {
    super.initState();

    _steps = [
      PersonalDataFormStep(nameController: _registerPatientDialogModel.nameController),
      VisitTypeFormStep(visitTypeSelection: _registerPatientDialogModel.visitTypeSelection),
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

class VisitTypeFormStep implements FormStep {
  final _formKey = GlobalKey<FormState>();
  final FormValue<String> visitTypeSelection;

  VisitTypeFormStep({this.visitTypeSelection});

  @override
  String get title => "Visit type";

  @override
  bool validate() {
    return _formKey.currentState.validate();
  }

  @override
  Widget get body => _VisitTypeFormStepBody(
        visitTypeSelection: visitTypeSelection,
      );
}

class _VisitTypeFormStepBody extends StatefulWidget {
  final FormValue<String> visitTypeSelection;

  _VisitTypeFormStepBody({this.visitTypeSelection});

  @override
  _VisitTypeFormStepBodyState createState() => _VisitTypeFormStepBodyState();
}

class _VisitTypeFormStepBodyState extends State<_VisitTypeFormStepBody> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(widget.visitTypeSelection.value));
  }
}
