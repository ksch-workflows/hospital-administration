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
  _FirstStep() : super(title: "First step");

  @override
  State<StatefulWidget> createState() => _FirstStepState();
}

class _FirstStepState extends State<_FirstStep> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            children: <Widget>[
              TextFormField(),
              TextFormField(),
            ]
        )
    );
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
