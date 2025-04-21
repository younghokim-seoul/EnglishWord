// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_word_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$exampleWordProviderHash() =>
    r'25e1c8f88a3b78f2927528ca937f3a074397b3b9';

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

abstract class _$ExampleWordProvider
    extends BuildlessAutoDisposeAsyncNotifier<List<WordExampleView>> {
  late final String word;
  late final int seq;

  FutureOr<List<WordExampleView>> build(
    String word,
    int seq,
  );
}

/// See also [ExampleWordProvider].
@ProviderFor(ExampleWordProvider)
const exampleWordProviderProvider = ExampleWordProviderFamily();

/// See also [ExampleWordProvider].
class ExampleWordProviderFamily
    extends Family<AsyncValue<List<WordExampleView>>> {
  /// See also [ExampleWordProvider].
  const ExampleWordProviderFamily();

  /// See also [ExampleWordProvider].
  ExampleWordProviderProvider call(
    String word,
    int seq,
  ) {
    return ExampleWordProviderProvider(
      word,
      seq,
    );
  }

  @override
  ExampleWordProviderProvider getProviderOverride(
    covariant ExampleWordProviderProvider provider,
  ) {
    return call(
      provider.word,
      provider.seq,
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
  String? get name => r'exampleWordProviderProvider';
}

/// See also [ExampleWordProvider].
class ExampleWordProviderProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ExampleWordProvider, List<WordExampleView>> {
  /// See also [ExampleWordProvider].
  ExampleWordProviderProvider(
    String word,
    int seq,
  ) : this._internal(
          () => ExampleWordProvider()
            ..word = word
            ..seq = seq,
          from: exampleWordProviderProvider,
          name: r'exampleWordProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exampleWordProviderHash,
          dependencies: ExampleWordProviderFamily._dependencies,
          allTransitiveDependencies:
              ExampleWordProviderFamily._allTransitiveDependencies,
          word: word,
          seq: seq,
        );

  ExampleWordProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.word,
    required this.seq,
  }) : super.internal();

  final String word;
  final int seq;

  @override
  FutureOr<List<WordExampleView>> runNotifierBuild(
    covariant ExampleWordProvider notifier,
  ) {
    return notifier.build(
      word,
      seq,
    );
  }

  @override
  Override overrideWith(ExampleWordProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExampleWordProviderProvider._internal(
        () => create()
          ..word = word
          ..seq = seq,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        word: word,
        seq: seq,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ExampleWordProvider,
      List<WordExampleView>> createElement() {
    return _ExampleWordProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExampleWordProviderProvider &&
        other.word == word &&
        other.seq == seq;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, word.hashCode);
    hash = _SystemHash.combine(hash, seq.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExampleWordProviderRef
    on AutoDisposeAsyncNotifierProviderRef<List<WordExampleView>> {
  /// The parameter `word` of this provider.
  String get word;

  /// The parameter `seq` of this provider.
  int get seq;
}

class _ExampleWordProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ExampleWordProvider,
        List<WordExampleView>> with ExampleWordProviderRef {
  _ExampleWordProviderProviderElement(super.provider);

  @override
  String get word => (origin as ExampleWordProviderProvider).word;
  @override
  int get seq => (origin as ExampleWordProviderProvider).seq;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
