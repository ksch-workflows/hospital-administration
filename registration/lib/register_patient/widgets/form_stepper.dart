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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(),
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: widget.steps[0],
          ),
        ),
        _ActionButtons(),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RaisedButton(
          child: Text("Back"),
          onPressed: () {},
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
          onPressed: () {},
        ),
      ],
    );
  }
}


