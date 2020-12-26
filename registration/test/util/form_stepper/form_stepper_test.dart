import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:registration/util/test_bench.dart';
import 'package:mockito/mockito.dart';

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

    assertSecondPage(tester);
  });

  testWidgets("Should go to previous step", (WidgetTester tester) async {
    await tester.open(ExampleStepper());
    await goToNextStep(tester);
    assertSecondPage(tester);

    await goToPreviousStep(tester);

    assertFirstPage(tester);
  });

  testWidgets("Should cancel stepper", (WidgetTester tester) async {
    bool canceledHasBeenCalled = false;
    await tester.open(ExampleStepper(
      onCancel: () => canceledHasBeenCalled = true,
    ));

    var button = find.byKey(ValueKey("cancelButton"));
    await tester.tap(button);

    expect(canceledHasBeenCalled, isTrue);
  });
}

Future goToNextStep(WidgetTester tester) async {
  var continueButton = find.byKey(ValueKey("continueButton"));
  expect(continueButton, findsOneWidget);

  await tester.tap(continueButton);
  await tester.pump();
}

Future goToPreviousStep(WidgetTester tester) async {
  var button = find.byKey(ValueKey("backButton"));
  expect(button, findsOneWidget);

  await tester.tap(button);
  await tester.pump();
}

void assertFirstPage(WidgetTester tester) {
  var inputField = find.byKey(ValueKey("firstStepInput"));
  expect(inputField, findsOneWidget);

  var secondStepInputField = find.byKey(ValueKey("secondStepInput"));
  expect(secondStepInputField, findsNothing);
}

void assertSecondPage(WidgetTester tester) {
  var inputField = find.byKey(ValueKey("secondStepInput"));
  expect(inputField, findsOneWidget);

  var firstStepInputField = find.byKey(ValueKey("firstStepInput"));
  expect(firstStepInputField, findsNothing);
}

extension WidgetTesterExtensions on WidgetTester {
  Future open(Widget widgetUnderTest) async {
    this.binding.window.textScaleFactorTestValue = 0.2; // Workaround to avoid pixel overflow errors
    return this.pumpWidget(TestBench(
      child: widgetUnderTest,
    ));
  }
}
