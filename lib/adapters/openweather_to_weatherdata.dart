class AdattatoreMeteo {

  // Metodo che converte ""adatta"" il JSON a una stringa di riepilogo meteo
  static String generaRiepilogoMeteo(Map<String, dynamic> meteoJson) {
    try {

      final descrizione = meteoJson['weather'][0]['description'] ?? 'N/A';
      final temperatura = meteoJson['main']['temp']?.toStringAsFixed(1) ?? 'N/A';
      final minima = meteoJson['main']['temp_min']?.toStringAsFixed(1) ?? 'N/A';
      final massima = meteoJson['main']['temp_max']?.toStringAsFixed(1) ?? 'N/A';
      final vento = meteoJson['wind']['speed']?.toStringAsFixed(1) ?? 'N/A';
      final umidita = meteoJson['main']['humidity']?.toString() ?? 'N/A';

      //Stringa di riepilogo
      return '''
      Meteo attuale:
      - ${descrizione[0].toUpperCase()}${descrizione.substring(1)}.
      - Temperatura: $temperatura °C (Min: $minima °C, Max: $massima °C).
      - Vento: $vento m/s.
      - Umidità: $umidita %.
      ''';
    } catch (e) {
      return 'Errore nel generare il meteo: ${e.toString()}';
    }
  }
}