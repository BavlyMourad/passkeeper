import 'package:flutter/material.dart';

import 'config/theme/app_theme.dart';

class PassKeeperApp extends StatelessWidget {
  const PassKeeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PassKeeper',
      theme: appTheme(),
    );
  }
}
