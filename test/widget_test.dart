// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:todos_flutter_poc/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.text('Premi il bottone per vedere il meteo.'), findsOneWidget);
    expect(find.text('Meteo attuale'), findsNothing);

    await tester.tap(find.text('Mostra il meteo'));
    await tester.pump();

    expect(find.text('Premi il bottone per vedere il meteo.'), findsNothing);
    expect(find.text('Meteo attuale'), findsOneWidget);
  });
}
