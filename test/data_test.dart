
import 'package:flutter_test/flutter_test.dart';
import 'package:todos_flutter_poc/adapters/openweather_to_weatherdata.dart';
import 'package:todos_flutter_poc/services/openweather_get_pn.dart';

void main() async {
  // test servizio e adattatore
  test('Test OpenWeather e AdattatoreMeteo', () async {
    final data = await OpenWeather.recuperaMeteo();
    print(data);

    var tradotto = AdattatoreMeteo.generaRiepilogoMeteo(data);

    print("");
    print("");
    print(tradotto);
    
    expect(tradotto.length > 40, true);
  });
}