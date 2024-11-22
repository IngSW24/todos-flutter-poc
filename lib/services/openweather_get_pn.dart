import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenWeather {
  //API Key: NON superare le  1000/gg chiamate
  static const String apiKey = '8bc79b7037ec041a3a93def986e05d14';
  static const String citta = 'Pordenonee';
  static const String baseUrl = 'hhttps://api.openweathermap.org/data/2.5/weather';

  /*
  * Ritorna una mappa dart che rappresenta i dati JSON del meteo
  *
  *(vedi in fondo file per esempio struttura json
  * */
  static Future<Map<String, dynamic>> recuperaMeteo() async {
    final String url = '$baseUrl?q=$citta&appid=$apiKey&units=metric&lang=it';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Errore API: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Errore nella richiesta: $e');
    }
  }

  /* ES JSON ritornato (I capi a noi rilevanti)
  * {
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "ceilo sereno",
    }
  ],
  "main": {
    "temp": 15.32,
    "feels_like": 14.8,
    "temp_min": 14.0,
    "temp_max": 16.0,
    "pressure": 1013,
    "humidity": 72
  },
  "wind": {
    "speed": 3.09,
    "deg": 90
  },
  "name": "Pordenone"
}
 */
}
