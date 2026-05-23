import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mek_notifier.g.dart';

@Riverpod(keepAlive: true)
class MekNotifier extends _$MekNotifier {
  @override
  Uint8List? build() => null; // null = not logged in

  void setMek(Uint8List mek) => state = mek;

  void clearMek() => state = null;
}
