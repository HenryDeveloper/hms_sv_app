import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hms_sv_app/src/common_widgets/password_text_form_field.dart';
import 'package:integration_test/integration_test.dart';

import 'package:hms_sv_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      "tap on the suffix icon for obscure or non-obscure the textformfile",
      (tester) async {
    await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
      home: Scaffold(
        body: Center(
          child: PasswordTextFormField(
            initialValue: "123456",
          ),
        ),
      ),
    )));

    final finder = find.byType(TextFormField);
    expect(finder, findsOneWidget);

    await tester.tap(finder);
    await tester.pumpAndSettle();

    final iconButtonFinder = find.byType(IconButton);
    expect(iconButtonFinder, findsOneWidget);

    await tester.tap(iconButtonFinder);
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 5));
  });
  testWidgets('tap on the floating action button, verify counter',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify the counter starts at 0.
    expect(find.text('0'), findsOneWidget);

    // Finds the floating action button to tap on.
    final Finder fab = find.byTooltip('Increment');

    // Emulate a tap on the floating action button.
    await tester.tap(fab);

    // Trigger a frame.
    await tester.pumpAndSettle();

    // Verify the counter increments by 1.
    expect(find.text('1'), findsOneWidget);
  });
}
