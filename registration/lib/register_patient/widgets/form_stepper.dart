import 'package:flutter/material.dart';

class FormStepper extends StatefulWidget {
  final List<FormStep> steps;

  FormStepper({
    @required this.steps,
  }) : assert(steps != null);

  @override
  _FormStepperState createState() => _FormStepperState();
}

abstract class FormStep extends StatelessWidget {
  String get title;

  bool validate() {
    return true;
  }
}

class _FormStepperState extends State<FormStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(),
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: widget.steps[currentStep],
          ),
        ),
        _ActionButtons(
          onBack: goToPreviousStep,
          onContinue: goToNextStep,
        ),
      ],
    );
  }

  void goToPreviousStep() {
    setState(() {
      if (currentStep != 0) {
        currentStep = currentStep - 1;
      }
    });
  }

  void goToNextStep() {
    setState(() {
      if (currentStep != widget.steps.length - 1) {
        currentStep = currentStep + 1;
      }
    });
  }
  
  int get currentStep {
    return _currentStep;
  }

  set currentStep(int value) {
    assert(value >= 0);
    assert(value < widget.steps.length);
    _currentStep = value;
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ActionButtons extends StatelessWidget {
  final Function onBack;
  final Function onCancel;
  final Function onContinue;

  _ActionButtons({this.onBack, this.onCancel, this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RaisedButton(
          child: Text("Back"),
          onPressed: onBack,
        ),
        Expanded(
          child: Container(),
        ),
        RaisedButton(
          child: Text("Cancel"),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text("Continue"),
          onPressed: onContinue,
        ),
      ],
    );
  }
}


