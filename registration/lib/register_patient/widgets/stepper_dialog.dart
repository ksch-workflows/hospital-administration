import 'package:flutter/material.dart';
import 'package:registration/test_bench.dart';

class StepperDialog extends StatefulWidget {
  List<Step> steps;

  StepperDialog({
    @required this.steps,
  }) : assert(steps != null);

  @override
  _StepperDialogState createState() => _StepperDialogState();
}

class _StepperDialogState extends State<StepperDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(),
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: widget.steps[1].content,
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

void main() {
  List<Step> steps = [
    Step(title: Text("First"), content: Text("111111111")),
    Step(title: Text("Second"), content: Text("222222222")),
    Step(title: Text("Third"), content: Text("333333333")),
  ];

  runApp(
    TestBench(
      child: StepperDialog(
        steps: steps,
      ),
    ),
  );
}
