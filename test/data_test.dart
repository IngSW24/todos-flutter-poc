import 'package:flutter_test/flutter_test.dart';
import 'package:todos_flutter_poc/adapters/openweather_to_weatherdata.dart';

void main() async {
  // test servizio e adattatore
  test('Test OpenWeather e AdattatoreMeteo', () async {
    final weather = await const AdattatoreMeteo().getWeather();
    expect(weather.length > 40, true);
  });
}