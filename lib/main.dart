import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/prompt_screen.dart';
import 'package:flutter_application_2/screens/result_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const PromptScreen()),
      GoRoute(path: '/result/:prompt', name: '/result', builder: (context, state) => ResultScreen(prompt: state.pathParameters['prompt'] ?? ''))
    ]
  );

  runApp(
    MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
    )
  );
}
