import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/register_patient/widgets/form_stepper.dart';
import 'package:registration/register_patient/widgets/stepper_cubit.dart';
import 'package:registration/test_bench.dart';

void main() {
  getIt.registerSingleton<_ExampleFormModel>(_ExampleFormModel());

  final List<FormStep> steps = [
    FormStep(FirstStepWidget(), FirstStepModel()),
    FormStep(FirstStepWidget(), FirstStepModel()),
  ];

  runApp(TestBench(
    child: BlocProvider(
      create: (BuildContext context) => StepperCubit(steps), // TODO Move down bloc provider
      child: FormStepper(
        steps: steps,
      ),
    ),
  ));
}

class _ExampleFormModel {
  FirstStepModel firstStep = FirstStepModel();
}

class FirstStepModel implements FormStepModel {
  final formKey = GlobalKey<FormState>();
  final exampleTextController = TextEditingController();

  @override
  bool validate() {
    var currentState = formKey.currentState;
    if (currentState == null) {
      return true;
    } else {
      return currentState.validate();
    }
  }
}

class SecondStepModel implements FormStepModel {
  final formKey = GlobalKey<FormState>();
  final exampleTextController = TextEditingController();

  @override
  bool validate() {
    var currentState = formKey.currentState;
    if (currentState == null) {
      return true;
    } else {
      return currentState.validate();
    }
  }
}

class FirstStepWidget extends StatelessWidget implements FormStepWidget, FormStep {
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
  // TODO: implement model
  FormStepModel get model => throw UnimplementedError();

  @override
  FormStepWidget get widget => this;
}
