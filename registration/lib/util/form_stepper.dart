import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

/// see https://flutter.dev/docs/cookbook/forms
abstract class FormStep {
  String get title;

  /// see
  Widget get body;

  bool validate();
}

/// References
/// - https://material.io/archive/guidelines/components/steppers.html#
/// - https://flutter.dev/docs/cookbook/forms
class FormStepper extends StatefulWidget {
  final List<FormStep> steps;
  final Function onCancel;

  FormStepper({
    @required this.steps,
    @required this.onCancel,
  })  : assert(steps != null),
        assert(onCancel != null);

  @override
  _FormStepperState createState() => _FormStepperState();
}

class _FormStepperState extends State<FormStepper> {
  int currentIndex;
  FormStep currentStep;

  _FormStepperState({int initialStepIndex = 0}) {
    currentIndex = initialStepIndex;
  }

  @override
  void initState() {
    super.initState();
    currentStep = widget.steps[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(
          stepTitles: widget.steps.map((s) => s.title).toList(),
          currentStep: currentIndex,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 20),
              child: widget.steps[currentIndex].body,
            ),
          ),
        ),
        _ActionButtons(
          onBack: onBack,
          onCancel: onCancel,
          onContinue: onContinue,
        ),
      ],
    );
  }

  void onBack() {
    if (!currentStep.validate()) {
      return;
    }
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        currentStep = widget.steps[currentIndex];
      });
    }
  }

  void onCancel() {
    widget.onCancel();
  }

  void onContinue() {
    if (!currentStep.validate()) {
      return;
    }
    if (currentIndex < widget.steps.length - 1) {
      setState(() {
        currentIndex++;
        currentStep = widget.steps[currentIndex];
      });
    }
  }
}

/// References
/// - https://stackoverflow.com/questions/57995591/manage-multiple-form-validation-in-stepper-flutter/58004730
/// - https://flutter.dev/docs/cookbook/forms/validation
/// - https://flutter.dev/docs/cookbook/forms/retrieve-input
abstract class FormStepWidget implements Widget {
  String get title;
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
          i == currentStep ? _ActiveIndexBubble(i) : _InactiveIndexBubble(i),
          Text(stepTitles[i], style: i == currentStep ? TextStyle(fontWeight: FontWeight.bold) : null),
        ],
      );
      stepTitleWidgets.add(stepTitleWidget);
    }

    return Column(
      children: [
        Row(children: [
          SizedBox(width: 15),
          ...stepTitleWidgets,
        ]),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor),
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

  _ActionButtons({@required this.onBack, @required this.onCancel, @required this.onContinue})
      : assert(onBack != null),
        assert(onCancel != null),
        assert(onContinue != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Row(
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
            onPressed: onCancel,
          ),
          SizedBox(
            width: 20,
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text(
              "Continue",
              style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            ),
            onPressed: onContinue,
          ),
        ],
      ),
    );
  }
}

class _IndexBubble extends StatelessWidget {
  final int index;
  final Color foregroundColor;
  final Color backgroundColor;

  _IndexBubble({
    this.index,
    this.foregroundColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          (index + 1).toString(),
          style: TextStyle(
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}

class _ActiveIndexBubble extends StatelessWidget {
  final int index;

  _ActiveIndexBubble(this.index);

  @override
  Widget build(BuildContext context) {
    return _IndexBubble(
      index: index,
      foregroundColor: Theme.of(context).colorScheme.onSecondary,
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}

class _InactiveIndexBubble extends StatelessWidget {
  final int index;

  _InactiveIndexBubble(this.index);

  @override
  Widget build(BuildContext context) {
    return _IndexBubble(
      index: index,
      backgroundColor: Theme.of(context).buttonColor,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
    );
  }
}
