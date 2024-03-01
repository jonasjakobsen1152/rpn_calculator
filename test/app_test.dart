import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
// Replace with your app name
import 'package:rpn_calculator/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test MyApp', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
  });

  testWidgets('Test Calculator Operations', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Find buttons
    var button2Finder = find.widgetWithText(ElevatedButton, '2');
    var button3Finder = find.widgetWithText(ElevatedButton, '3');
    var buttonPlusFinder = find.widgetWithText(ElevatedButton, '+');
    var buttonEnterFinder = find.widgetWithText(ElevatedButton, 'enter');

    // Tap '2'
    await tester.tap(button2Finder);
    await tester.pumpAndSettle();

    // Tap 'enter'
    await tester.tap(buttonEnterFinder);
    await tester.pumpAndSettle();

    // Tap '3'
    await tester.tap(button3Finder);
    await tester.pumpAndSettle();

    // Tap 'enter'
    await tester.tap(buttonEnterFinder);
    await tester.pumpAndSettle();

    // Tap '+'
    await tester.tap(buttonPlusFinder);
    await tester.pumpAndSettle();

    // Tap 'enter'
    await tester.tap(buttonEnterFinder);
    await tester.pumpAndSettle();

    // Find the result text
    var resultFinder = find.text('5');

    // Verify the result is '5'
    expect(resultFinder, findsOneWidget);
  });
}