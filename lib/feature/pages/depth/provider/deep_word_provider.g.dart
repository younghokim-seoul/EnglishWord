// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_word_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deepWordProviderHash() => r'd872e3de6490046f4ae2cde77a66cbbaef407ff4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DeepWordProvider
    extends BuildlessAutoDisposeStreamNotifier<DeepWordWithWords> {
  late final String word;

  Stream<DeepWordWithWords> build(
    String word,
  );
}

/// See also [DeepWordProvider].
@ProviderFor(DeepWordProvider)
const deepWordProviderProvider = DeepWordProviderFamily();

/// See also [DeepWordProvider].
class DeepWordProviderFamily extends Family<AsyncValue<DeepWordWithWords>> {
  /// See also [DeepWordProvider].
  const DeepWordProviderFamily();

  /// See also [DeepWordProvider].
  DeepWordProviderProvider call(
    String word,
  ) {
    return DeepWordProviderProvider(
      word,
    );
  }

  @override
  DeepWordProviderProvider getProviderOverride(
    covariant DeepWordProviderProvider provider,
  ) {
    return call(
      provider.word,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deepWordProviderProvider';
}

/// See also [DeepWordProvider].
class DeepWordProviderProvider extends AutoDisposeStreamNotifierProviderImpl<
    DeepWordProvider, DeepWordWithWords> {
  /// See also [DeepWordProvider].
  DeepWordProviderProvider(
    String word,
  ) : this._internal(
          () => DeepWordProvider()..word = word,
          from: deepWordProviderProvider,
          name: r'deepWordProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deepWordProviderHash,
          dependencies: DeepWordProviderFamily._dependencies,
          allTransitiveDependencies:
              DeepWordProviderFamily._allTransitiveDependencies,
          word: word,
        );

  DeepWordProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.word,
  }) : super.internal();

  final String word;

  @override
  Stream<DeepWordWithWords> runNotifierBuild(
    covariant DeepWordProvider notifier,
  ) {
    return notifier.build(
      word,
    );
  }

  @override
  Override overrideWith(DeepWordProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: DeepWordProviderProvider._internal(
        () => create()..word = word,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        word: word,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<DeepWordProvider, DeepWordWithWords>
      createElement() {
    return _DeepWordProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeepWordProviderProvider && other.word == word;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, word.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeepWordProviderRef
    on AutoDisposeStreamNotifierProviderRef<DeepWordWithWords> {
  /// The parameter `word` of this provider.
  String get word;
}

class _DeepWordProviderProviderElement
    extends AutoDisposeStreamNotifierProviderElement<DeepWordProvider,
        DeepWordWithWords> with DeepWordProviderRef {
  _DeepWordProviderProviderElement(super.provider);

  @override
  String get word => (origin as DeepWordProviderProvider).word;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
