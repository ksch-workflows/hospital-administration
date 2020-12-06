import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/register_patient/widgets/stepper_cubit.dart';

/// References
/// - https://material.io/archive/guidelines/components/steppers.html#
class FormStepper extends StatelessWidget {
  final List<FormStep> steps;

  FormStepper({
    @required this.steps,
  }) : assert(steps != null);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepperCubit, StepperState>(
      builder: (context, state) {
        return Column(
          children: [
            _Header(
              stepTitles: steps.map((s) => s.title).toList(),
              currentStep: state.index,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 25, 20),
                  child: steps[state.index],
                ),
              ),
            ),
            _ActionButtons(),
          ],
        );
      }
    );
  }
  
}

/// References
/// - https://stackoverflow.com/questions/57995591/manage-multiple-form-validation-in-stepper-flutter/58004730
/// - https://flutter.dev/docs/cookbook/forms/validation
/// - https://flutter.dev/docs/cookbook/forms/retrieve-input
abstract class FormStep implements Widget {
  String get title;
  bool validate();
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

  _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Row(
        children: [
          RaisedButton(
            child: Text("Back"),
            onPressed: () => context.read<StepperCubit>().back(),
          ),
          Expanded(
            child: Container(),
          ),
          RaisedButton(
            child: Text("Cancel"),
            onPressed: () => print("TODO: Support stepper cancellation"),
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
            onPressed: () => context.read<StepperCubit>().next(),
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

