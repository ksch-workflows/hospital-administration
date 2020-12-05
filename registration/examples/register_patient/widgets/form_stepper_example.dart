import 'package:flutter/material.dart';
import 'package:registration/register_patient/widgets/form_stepper.dart';
import 'package:registration/test_bench.dart';

void main() {
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

class _FirstStep extends FormStep {
  @override
  String get title => "First";

  @override
  Widget build(BuildContext context) {
    return Text("1.11111111");
  }
}

class _SecondStep extends FormStep {
  @override
  String get title => "Second";

  @override
  Widget build(BuildContext context) {
    return Text("2.222222222");
  }
}

class _ThirdStep extends FormStep {
  @override
  String get title => "Third";

  @override
  Widget build(BuildContext context) {
    return Text("3.3333333333");
  }
}
