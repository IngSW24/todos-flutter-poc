import 'package:flutter/material.dart';
import 'package:todos_flutter_poc/services/openweather_get_pn.dart';
import '/ui/components/clickable_text.dart';
import '/ui/components/my_app_bar.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key, required this.title
  });

  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  String? _meteoReport;

  Future<void> recuperaMeteo() async{
    setState(() {
      //Chiamre OpenWeather e l'adapter per recuperare il report
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meteo Pordenone'),
      ),
      body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      ElevatedButton(
      onPressed: recuperaMeteo,
      child: const Text('Mostra il meteo'),
    ),
    const SizedBox(height: 20),
        if (_meteoReport == null)
          const Text(
            'Premi il bottone per vedere il meteo.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          )
        else
          Text(
            "$_meteoReport",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
      ],
      ),
      ),
    );
  }
}
