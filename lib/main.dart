import 'package:flutter/material.dart';
import 'homepage.dart';
import 'quiz.dart';
import 'resultados.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        'Quiz': (context) => Quiz(
              quiz: [],
            ),
        Resultado.routeName: (context) => Resultado(),
      },
    );
  }
}
