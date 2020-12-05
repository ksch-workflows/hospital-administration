import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

/// References
/// - https://material.io/archive/guidelines/components/steppers.html#
class FormStepper extends StatefulWidget {
  final List<FormStep> steps;

  FormStepper({
    @required this.steps,
  }) : assert(steps != null);

  @override
  _FormStepperState createState() => _FormStepperState();
}

abstract class FormStep extends StatelessWidget {
  final String title;

  FormStep({this.title});

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
        _Header(
          stepTitles: widget.steps.map((s) => s.title).toList(),
          currentStep: currentStep,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: widget.steps[currentStep],
            ),
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
  final List<String> stepTitles;
  final int currentStep;

  _Header({@required this.stepTitles, @required this.currentStep}) : assert(stepTitles != null);

  @override
  Widget build(BuildContext context) {
    List<Widget> stepTitleWidgets = [];
    for (int i = 0; i < stepTitles.length; i++) {
      Widget stepTitleWidget = Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(i.toString()),
            ),
          ),
          Text(stepTitles[i], style: i == currentStep ? TextStyle(fontWeight: FontWeight.bold) : null),
        ],
      );
      stepTitleWidgets.add(stepTitleWidget);
    }

    return Column(
      children: [
        Row(children: stepTitleWidgets),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
        ),
      ],
    );
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
