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
    return true;
  }

  @override
  Widget get body => _VisitTypeFormStepBody(visitTypeSelection: visitTypeSelection);
}

class _VisitTypeFormStepBody extends StatefulWidget {
  final FormValue<String> visitTypeSelection;

  _VisitTypeFormStepBody({this.visitTypeSelection});

  @override
  _VisitTypeFormStepBodyState createState() => _VisitTypeFormStepBodyState(visitTypeSelection: visitTypeSelection);
}

class _VisitTypeFormStepBodyState extends State<_VisitTypeFormStepBody> {
  final FormValue<String> visitTypeSelection;

  _VisitTypeFormStepBodyState({@required this.visitTypeSelection}): assert(visitTypeSelection != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: visitTypeSelection.value,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              visitTypeSelection.value = newValue;
            });
          },
          items: <String>['One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
