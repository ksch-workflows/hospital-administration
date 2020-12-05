import 'package:flutter/material.dart';
import 'package:registration/test_bench.dart';

class StepperDialog extends StatefulWidget {
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
          child: Container(
            child: Text("Content"),
            color: Colors.red,
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
        Expanded(child: Container(),),
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
  runApp(
    TestBench(
      child: StepperDialog(),
    ),
  );
}
