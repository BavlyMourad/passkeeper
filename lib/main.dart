import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:passkeeper/app.dart';
import 'package:passkeeper/core/constants/hive_boxes.dart';
import 'package:passkeeper/core/providers/boxes.dart';
import 'package:passkeeper/core/providers/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();
  final passwordsBox = await Hive.openBox<String>(HiveBoxes.passwords);
  final categoriesBox = await Hive.openBox<String>(HiveBoxes.categories);

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        passwordsBoxProvider.overrideWithValue(passwordsBox),
        categoriesBoxProvider.overrideWithValue(categoriesBox),
        sharedPrefsProvider.overrideWithValue(sharedPreferences),
      ],
      child: const PassKeeperApp(),
    ),
  );
}
