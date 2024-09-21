import 'package:flutter/material.dart';

class PassKeeperApp extends StatelessWidget {
  const PassKeeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PassKeeper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF5252),
        ),
        useMaterial3: true,
      ),
      home: const Placeholder(),
    );
  }
}
