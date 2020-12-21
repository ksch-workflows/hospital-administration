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

  _VisitTypeFormStepBodyState({@required this.visitTypeSelection}) : assert(visitTypeSelection != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText:  visitTypeSelection.value != null ? "Visit type" : null,
                  border: const OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(left: 10)
                  //contentPadding: EdgeInsets.only(left: 10),
                ),
                child: Container(
                  // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(3),
                  //   border: Border.all(
                  //     color: Colors.grey[500],
                  //   ),
                  // ),
                  // decoration: BoxDecoration(
                  //
                  //     border: Border.all()),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: visitTypeSelection.value,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      hint: Text("Please select a visit type..."),
                      onChanged: (String newValue) {
                        setState(() {
                          visitTypeSelection.value = newValue;
                        });
                      },
                      items: <String>['OPD', 'IPD'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
