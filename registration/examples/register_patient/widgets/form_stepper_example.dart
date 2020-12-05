import 'package:flutter/material.dart';
import 'package:registration/register_patient/widgets/form_stepper.dart';
import 'package:registration/test_bench.dart';

void main() {
  var firstStep = _FirstStep();
  var secondStep = _SecondStep();
  var thirdStep = _ThirdStep();

  runApp(
    TestBench(
      child: FormStepper(
        steps: [
          firstStep,
          secondStep,
          thirdStep,
        ],
      ),
    ),
  );
}

class _FirstStep extends FormStep {
  final _formKey = GlobalKey<FormState>();

  _FirstStep() : super(title: "First step");

  @override
  State<StatefulWidget> createState() => _FirstStepState();

  @override
  bool validate() {
    var currentState = _formKey.currentState;
    if (currentState != null) {
      return currentState.validate();
    } else {
      return true;
    }
  }
}

class _FirstStepState extends State<_FirstStep> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget._formKey,
        child: Column(children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter some text";
              }
              return null;
            },
          ),
          TextFormField(),
        ]));
  }
}

class _SecondStep extends FormStep {
  _SecondStep() : super(title: "Second step");

  @override
  State<StatefulWidget> createState() => _SecondStepState();
}

class _SecondStepState extends State<_SecondStep> {
  @override
  Widget build(BuildContext context) {
    return Text("Second step state");
  }
}

class _ThirdStep extends FormStep {
  _ThirdStep() : super(title: "Third step");

  @override
  State<StatefulWidget> createState() => _ThirdStepState();
}

class _ThirdStepState extends State<_ThirdStep> {
  @override
  Widget build(BuildContext context) {
    return Text("Third step state");
  }
}
