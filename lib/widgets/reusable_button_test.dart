
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/widgets/reusable_button.dart';

void main() {
  testWidgets('SquaredButton displays its label',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SquaredButton(
            label: 'BOOK NOW',
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('BOOK NOW'), findsOneWidget);
  });

  testWidgets('SquaredButton calls onPressed when tapped',
      (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SquaredButton(
            label: 'BOOK NOW',
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('BOOK NOW'));

    expect(wasPressed, isTrue);
  });
}
