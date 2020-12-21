import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:registration/ui/register_patient/register_patient_dialog/form_stepper.dart';

GetIt getIt = GetIt.instance;

class RegisterPatientDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPatientDialogState();
}

class _RegisterPatientDialogState extends State<RegisterPatientDialog> with AutomaticKeepAliveClientMixin {
  bool _submittedOrCanceled = false;
  List<FormStep> _steps;
  DropdownButtonSelection<String> _visitTypeSelection;

  @override
  void initState() {
    super.initState();

    _visitTypeSelection = DropdownButtonSelection<String>();
    _visitTypeSelection.value = "Dummy value";

    _steps = [
      VisitTypeFormStep(visitTypeSelection: _visitTypeSelection),
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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

  @override
  bool get wantKeepAlive => !_submittedOrCanceled;
}

class DropdownButtonSelection<T> {
  T value;
}

class VisitTypeFormStep implements FormStep {
  final _formKey = GlobalKey<FormState>();
  final DropdownButtonSelection<String> visitTypeSelection;
  
  VisitTypeFormStep({ this.visitTypeSelection });

  @override
  String get title => "Visit type";

  @override
  bool validate() {
    return _formKey.currentState.validate();
  }

  @override
  Widget get body => _VisitTypeFormStepBody(visitTypeSelection: visitTypeSelection,);
}

class _VisitTypeFormStepBody extends StatefulWidget {
  final DropdownButtonSelection<String> visitTypeSelection;

  _VisitTypeFormStepBody({ this.visitTypeSelection });

  @override
  _VisitTypeFormStepBodyState createState() => _VisitTypeFormStepBodyState();
}

class _VisitTypeFormStepBodyState extends State<_VisitTypeFormStepBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.visitTypeSelection.value)
    );
  }
}
