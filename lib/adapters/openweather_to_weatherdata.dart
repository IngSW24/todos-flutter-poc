import 'package:todos_flutter_poc/adapters/service_adapter.dart';
import 'package:todos_flutter_poc/services/openweather_get_pn.dart';

class AdattatoreMeteo implements ServiceAdapter {
  const AdattatoreMeteo();

  // Metodo che converte ""adatta"" il JSON a una stringa di riepilogo meteo
  static String _generaRiepilogoMeteo(Map<String, dynamic> meteoJson) {

      final descrizione = meteoJson['weather']?[0]?['description'] ?? 'N/A';
      final temperatura = meteoJson['main']?['temp']?.toStringAsFixed(1) ?? 'N/A';
      final minima = meteoJson['main']?['temp_min']?.toStringAsFixed(1) ?? 'N/A';
      final massima = meteoJson['main']?['temp_max']?.toStringAsFixed(1) ?? 'N/A';
      final vento = meteoJson['wind']?['speed']?.toStringAsFixed(1) ?? 'N/A';
      final umidita = meteoJson['main']?['humidity']?.toString() ?? 'N/A';
      final cod = meteoJson['cod']?.toString() ?? "N/A";


      if(cod == "200"){

        //Stringa di riepilogo
        return '''
        Meteo attuale:
        - ${descrizione[0].toUpperCase()}${descrizione.substring(1)}.
        - Temperatura: $temperatura °C (Min: $minima °C, Max: $massima °C).
        - Vento: $vento m/s.
        - Umidità: $umidita %.
      ''';

      }else{
        return "Non è stato possibile recuperare i dati meteo";
      }
  }

  @override
  Future<String> getWeather() async {
    return _generaRiepilogoMeteo(await OpenWeather.recuperaMeteo());
  }
}
