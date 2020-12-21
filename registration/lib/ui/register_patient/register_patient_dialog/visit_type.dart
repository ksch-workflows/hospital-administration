import 'package:flutter/material.dart';
import 'package:registration/util/form_stepper.dart';
import 'package:registration/util/form_value.dart';

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
    return Container(child: Text("<visit type placeholder>"));
  }
}
