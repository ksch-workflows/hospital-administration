import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:registration/register_patient/widgets/form_stepper.dart';

GetIt getIt = GetIt.instance;

class RegisterPatientDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPatientDialogState();
}

class _RegisterPatientDialogState extends State<RegisterPatientDialog> {
  @override
  void initState() {
    super.initState();
    if (!getIt.isRegistered<_RegisterPatientDialogModel>()) {
      getIt.registerSingleton<_RegisterPatientDialogModel>(_RegisterPatientDialogModel());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Register patient"),
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.tight(Size(800, 400)),
          child: FormStepper(
            steps: [
//              _PersonalDataForm(),
//              _ContactInformationForm(),
//              _VisitTypeForm(),
            ],
          ),
        ),
      ],
    );
  }
}

class _RegisterPatientDialogModel {
  _PersonalDataModel personalData = _PersonalDataModel();
  _ContactInformationModel contactInformation = _ContactInformationModel();
  _VisitTypeModel visitType = _VisitTypeModel();
}

class _PersonalDataModel {
  final formKey = GlobalKey<FormState>();
  final nameFieldController = TextEditingController();
  final fatherNameFieldController = TextEditingController();
}

class _ContactInformationModel {
  final formKey = GlobalKey<FormState>();
  final locationFieldController = TextEditingController();
}

class _VisitTypeModel {
  final formKey = GlobalKey<FormState>();
}

class _PersonalDataForm extends StatelessWidget implements FormStepWidget {
  final _PersonalDataModel formModel = getIt<_RegisterPatientDialogModel>().personalData;

  _PersonalDataForm();

  @override
  String get title => "Personal data";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formModel.formKey,
      child: Column(children: <Widget>[
        TextFormField(
          controller: formModel.nameFieldController,
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
          controller: formModel.fatherNameFieldController,
          decoration: InputDecoration(
            labelText: "Father's name",
            border: const OutlineInputBorder(),
            hintText: "Please enter the patient father's name, if applicable",
          ),
        ),
      ]),
    );
  }

  bool validate() {
    var currentState = formModel.formKey.currentState;
    if (currentState != null) {
      return currentState.validate();
    } else {
      return true;
    }
  }
}

class _ContactInformationForm extends StatelessWidget implements FormStepWidget {
  final _ContactInformationModel formModel = getIt<_RegisterPatientDialogModel>().contactInformation;
  
  _ContactInformationForm();

  @override
  String get title => "Contact information";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formModel.formKey,
      child: Column(children: <Widget>[
        TextFormField(
          controller: formModel.locationFieldController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "The patient's location is required information.";
            }
            return null;
          },
          decoration: InputDecoration(
              labelText: "Location*",
              border: OutlineInputBorder(),
              hintText: "Please enter the patient's location",
              helperText: "* Required"),
        ),
      ]),
    );
  }

  @override
  bool validate() {
    var currentState = formModel.formKey.currentState;
    if (currentState != null) {
      return currentState.validate();
    } else {
      return true;
    }
  }
}

class _VisitTypeForm extends StatelessWidget implements FormStepWidget {
  _VisitTypeForm();

  @override
  String get title => "Visit type";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  bool validate() {
    // TODO: implement validate
    throw UnimplementedError();
  }
}
