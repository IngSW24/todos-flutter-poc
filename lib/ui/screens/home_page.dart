import 'package:flutter/material.dart';
import 'package:todos_flutter_poc/adapters/openweather_to_weatherdata.dart';
import 'package:todos_flutter_poc/adapters/service_adapter.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  HomePage(this.title, {super.key, this.serviceAdapter = const AdattatoreMeteo()});

  final String title;
  final ServiceAdapter serviceAdapter;

  @override
  State<HomePage> createState() => _HomePage(serviceAdapter);
}

class _HomePage extends State<HomePage> {
  _HomePage(this.serviceAdapter);
  final ServiceAdapter serviceAdapter;
  String? _meteoReport;

  Future<void> _recuperaMeteo() async {
    var meteo = await serviceAdapter.getWeather();
    
    setState(() {
      //Chiamre OpenWeather e l'adapter per recuperare il report
      _meteoReport = meteo;
    });
  }

  void _pulisciMeteo() {
    setState(() {
      _meteoReport = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meteo Pordenone'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: _recuperaMeteo,
                child: const Text('Mostra il meteo'),
              ),
              TextButton(onPressed: () => context.go("/page1"), child: const Text("Go to page1"))
            ],
          ),
          const SizedBox(height: 60),
          if (_meteoReport == null)
            const Text(
              'Premi il bottone per vedere il meteo.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            )
          else
            Text(
              "$_meteoReport",
              style: const TextStyle(fontSize: 16),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pulisciMeteo,
        child: const Icon(Icons.clear),
      ),
    );
  }
}
