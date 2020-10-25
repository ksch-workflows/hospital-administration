import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:registration/activity.dart';

import 'test_app.dart';

void main() {
  testWidgets('Should enable to go to previous page', (WidgetTester tester) async {
    bool callbackExecuted = false;
    await tester.pumpWidget(TestApp(
      Activity(
        title: "Demo",
        body: Text("Hello, World!"),
        onNavigateBack: () {
          callbackExecuted = true;
        },
      ),
    ));

    var iconSearchResult = find.byIcon(Icons.arrow_back);
    expect(iconSearchResult, findsOneWidget);

    await tester.tap(iconSearchResult);

    expect(callbackExecuted, true);
  });

  testWidgets('Should not render back button if going back to previous page is not applicable', (WidgetTester tester) async {
    await tester.pumpWidget(TestApp(
      Activity(
        title: "Demo",
        body: Text("Hello, World!"),
      ),
    ));

    var iconSearchResult = find.byIcon(Icons.arrow_back);

    expect(iconSearchResult, findsNothing);
  });
}
