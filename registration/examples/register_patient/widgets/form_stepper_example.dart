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

class _FirstStep extends StatelessWidget implements FormStep {

  _FirstStep();

  @override
  String get title => "First step";

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

class _SecondStep extends StatelessWidget implements FormStep {
  _SecondStep();

  @override
  Widget build(BuildContext context) {
    return Text("Second step state");
  }

  @override
  String get title => "Second step";

  @override
  bool validate() => true;
}

class _ThirdStep extends StatelessWidget implements FormStep {
  _ThirdStep();

  @override
  Widget build(BuildContext context) {
    return Text("Third step state");
  }

  @override
  String get title => "Third step";

  @override
  bool validate() => true;
}
