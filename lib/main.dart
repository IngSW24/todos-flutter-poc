import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todos_flutter_poc/ui/screens/home_page.dart';
import 'package:todos_flutter_poc/ui/screens/page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: myRouter
    );
  }
}

final myRouter = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (ctx, state) => const HomePage(title: 'Hello'),
          routes: [
            GoRoute(path: 'page1',
            builder: (ctx, state) => const Page1())
          ]
      )
    ]
);


