import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:registration/util/test_bench.dart';

import 'form_stepper_example.dart';

void main() {
  testWidgets("Should allow to enter text for the first step", (WidgetTester tester) async {
    var exampleStepper = ExampleStepper();
    await tester.open(exampleStepper);

    var firstStepInputField = find.byKey(ValueKey("firstStepInput"));
    expect(firstStepInputField, findsOneWidget);
    await tester.enterText(firstStepInputField, "John Doe");
    await tester.pump();

    expect(exampleStepper.firstStepInputController.text, equals("John Doe"));
  });

  testWidgets("Should go to next step", (WidgetTester tester) async {
    await tester.open(ExampleStepper());

    await goToNextStep(tester);

    var firstStepInputField = find.byKey(ValueKey("firstStepInput"));
    expect(firstStepInputField, findsNothing);
    var secondStepInput = find.byKey(ValueKey("secondStepInput"));
    expect(secondStepInput, findsOneWidget);
  });
  
  // testWidgets("Should go to previous step", (WidgetTester tester) async {
  //   await tester.open(ExampleStepper());
  //   var firstStepInputField = find.byKey(ValueKey("myWidget"));
  //   expect(firstStepInputField, findsOneWidget);
  // });
}

Future goToNextStep(WidgetTester tester) async {
  var continueButton = find.byKey(ValueKey("continueButton"));
  expect(continueButton, findsOneWidget);
  
  await tester.tap(continueButton);
  await tester.pump();
}

extension WidgetTesterExtensions on WidgetTester {
  Future open(Widget widgetUnderTest) async {
    this.binding.window.textScaleFactorTestValue = 0.2; // Work around to avoid pixel overflow errors
    return this.pumpWidget(TestBench(
      child: widgetUnderTest,
    ));
  }
}
