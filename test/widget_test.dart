import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todos_flutter_poc/adapters/service_adapter.dart';
import 'package:todos_flutter_poc/ui/screens/home_page.dart';

void main() {
  testWidgets('Visualizzazione dati meteo', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: HomePage("Title", serviceAdapter: TestServiceAdapter())));

    expect(find.text('Premi il bottone per vedere il meteo.'), findsOneWidget);
    expect(find.text('Meteo attuale'), findsNothing);

    await tester.tap(find.text('Mostra il meteo'));
    await tester.pump();

    expect(find.text('Premi il bottone per vedere il meteo.'), findsNothing);
    expect(find.text('Meteo attuale'), findsOneWidget);
  });
}

class TestServiceAdapter implements ServiceAdapter {
  @override
  Future<String> getWeather() async {
    return "Meteo attuale";
  }
}
