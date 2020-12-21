import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:registration/ui/register_patient/register_patient_dialog/form_stepper.dart';

GetIt getIt = GetIt.instance;

_RegisterPatientDialogModel kRegisterPatientDialogModel = _RegisterPatientDialogModel();


class RegisterPatientDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPatientDialogState();
}

class _RegisterPatientDialogModel {
  final visitTypeSelection = DropdownButtonSelection<String>();
  final nameController = TextEditingController();
}

class _RegisterPatientDialogState extends State<RegisterPatientDialog> {

  List<FormStep> _steps;

  @override
  void initState() {
    super.initState();

    kRegisterPatientDialogModel.visitTypeSelection.value = "Some dummy value";

    _steps = [
      PersonalDataFormStep(nameController: kRegisterPatientDialogModel.nameController),
      VisitTypeFormStep(visitTypeSelection: kRegisterPatientDialogModel.visitTypeSelection),
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

class DropdownButtonSelection<T> {
  T value;
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
  final DropdownButtonSelection<String> visitTypeSelection;

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
  final DropdownButtonSelection<String> visitTypeSelection;

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
