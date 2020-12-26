import 'package:flutter/material.dart';
import 'package:registration/util/form_stepper.dart';

class ExampleStepper extends StatefulWidget {
  final TextEditingController firstStepInputController = TextEditingController();
  final TextEditingController secondStepInputController = TextEditingController();
  final TextEditingController thirdStepInputController = TextEditingController();

  @override
  _ExampleStepperState createState() => _ExampleStepperState();
}

class _ExampleStepperState extends State<ExampleStepper> {
  List<FormStep> steps;

  @override
  void initState() {
    super.initState();

    steps = [
      _FirstStep(widget.firstStepInputController),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FormStepper(steps: steps, onCancel: () => {}, onSave: () => {});
  }
}

class _FirstStep implements FormStep {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstStepInputController;

  _FirstStep(this.firstStepInputController);

  @override
  Widget get body {
    return Form(
      key: formKey,
      child: TextFormField(
        key: ValueKey("firstStepInput"),
        controller: firstStepInputController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "The input for the first step is mandatory.";
          }
          return null;
        },
      ),
    );
  }

  @override
  String get title => "First step";

  @override
  bool validate() => formKey.currentState.validate();
}

class _FirstForm extends StatelessWidget {
  final TextEditingController firstStepInputController;

  _FirstForm(this.firstStepInputController);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _SecondForm extends StatelessWidget {
  final TextEditingController secondStepInputController;

  _SecondForm(this.secondStepInputController);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ThirdForm extends StatelessWidget {
  final TextEditingController thirdStepInputController;

  _ThirdForm(this.thirdStepInputController);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
