import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:registration/register_patient/register_patient_page.dart";
import "package:registration/test_bench.dart";

void main() {
  testWidgets("Should show search results", (WidgetTester tester) async {
    tester.binding.window.textScaleFactorTestValue = 0.2;

    await tester.pumpWidget(TestBench(
      child: RegisterPatientPage(),
      isFullPage: true,
    ));
    var patientSearchInputField = find.byType(TextField);

    await tester.enterText(patientSearchInputField, "John");
    await tester.pump();

    expect(find.byType(DataTable), findsOneWidget);
  });

  testWidgets("Should not show search result table before the search", (WidgetTester tester) async {
    tester.binding.window.textScaleFactorTestValue = 0.2;

    await tester.pumpWidget(TestBench(
      child: RegisterPatientPage(),
      isFullPage: false,
    ));

    expect(find.byType(DataTable), findsNothing);
  });

  testWidgets("Should show message about no search results", (WidgetTester tester) async {
    tester.binding.window.textScaleFactorTestValue = 0.2;

    await tester.pumpWidget(TestBench(
      child: RegisterPatientPage(),
      isFullPage: false,
    ));

    var patientSearchInputField = find.byType(TextField);
    await tester.enterText(patientSearchInputField, "xxxxxxx");
    await tester.pump();

    expect(find.text("No patients found."), findsOneWidget);
  });
}
