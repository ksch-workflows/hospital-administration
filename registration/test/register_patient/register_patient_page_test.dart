/*
TODO
- should show search results
- should not show search result table before the search
- should show message about empty search results
- should open dialog for patient registration
- should navigate to patient details
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:registration/register_patient/register_patient_page.dart';
import 'package:registration/test_bench.dart';

void main() {
  testWidgets('Should show search results', (WidgetTester tester) async {
    tester.binding.window.textScaleFactorTestValue = 0.2;

    await tester.pumpWidget(TestBench(
      child: RegisterPatientPage(),
      isFullPage: false,
    ));
    var patientSearchInputField = find.byType(TextField);

    await tester.enterText(patientSearchInputField, "John");
    await tester.pump();

    expect(find.byType(DataTable), findsOneWidget);
  });
}
