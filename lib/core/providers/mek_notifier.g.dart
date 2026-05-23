// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mek_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MekNotifier)
final mekProvider = MekNotifierProvider._();

final class MekNotifierProvider
    extends $NotifierProvider<MekNotifier, Uint8List?> {
  MekNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mekProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mekNotifierHash();

  @$internal
  @override
  MekNotifier create() => MekNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Uint8List? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Uint8List?>(value),
    );
  }
}

String _$mekNotifierHash() => r'8b9254a9823831d7614251a9327d98923bdc09ce';

abstract class _$MekNotifier extends $Notifier<Uint8List?> {
  Uint8List? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Uint8List?, Uint8List?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Uint8List?, Uint8List?>,
              Uint8List?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
