import 'package:flutter/material.dart';
import 'package:registration/register_patient/widgets/form_stepper.dart';
import 'package:registration/test_bench.dart';

void main() {
  getIt.registerSingleton<_ExampleFormModel>(_ExampleFormModel());

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

class _ExampleFormModel {
  FirstStepModel firstStep = FirstStepModel();
}

class FirstStepModel {
  final formKey = GlobalKey<FormState>();
  final exampleTextController = TextEditingController();
}

class _FirstStep extends FormStep {

  _FirstStep() : super(title: "First step");

  @override
  Widget build(BuildContext context) {
    var model = getIt<_ExampleFormModel>().firstStep;
    return Form(
        key: model.formKey,
        child: Column(children: <Widget>[
          TextFormField(
            controller: model.exampleTextController,
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

  @override
  bool validate() {
    var model = getIt<_ExampleFormModel>().firstStep;
    var currentState = model.formKey.currentState;
    if (currentState != null) {
      return currentState.validate();
    } else {
      return true;
    }
  }
}

class _SecondStep extends FormStep {
  _SecondStep() : super(title: "Second step");

  @override
  Widget build(BuildContext context) {
    return Text("Second step state");
  }

  @override
  bool validate() => true;
}

class _ThirdStep extends FormStep {
  _ThirdStep() : super(title: "Third step");

  @override
  Widget build(BuildContext context) {
    return Text("Third step state");
  }

  @override
  bool validate() => true;
}
