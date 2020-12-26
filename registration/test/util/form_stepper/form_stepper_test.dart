import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:registration/util/test_bench.dart';

import 'example_stepper.dart';

void main() {
  testWidgets("Should allow to enter text for the first step", (WidgetTester tester) async {
    var exampleStepper = ExampleStepper();

    await tester.pumpWidget(TestBench(
      child: exampleStepper,
    ));
    var firstStepInputField = find.byKey(ValueKey("firstStepInput"));
    expect(firstStepInputField, findsOneWidget);

    await tester.enterText(firstStepInputField, "John Doe");
    await tester.pump();

    expect(exampleStepper.firstStepInputController.text, equals("John Doe"));
  });
}
