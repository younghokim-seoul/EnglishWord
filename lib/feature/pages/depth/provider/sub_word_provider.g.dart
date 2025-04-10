// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_word_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subWordProviderHash() => r'ced4c4272c6e936bfb5731524999ff961725703d';

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

abstract class _$SubWordProvider
    extends BuildlessAutoDisposeAsyncNotifier<SubWordWithWords?> {
  late final String word;

  FutureOr<SubWordWithWords?> build(
    String word,
  );
}

/// See also [SubWordProvider].
@ProviderFor(SubWordProvider)
const subWordProviderProvider = SubWordProviderFamily();

/// See also [SubWordProvider].
class SubWordProviderFamily extends Family<AsyncValue<SubWordWithWords?>> {
  /// See also [SubWordProvider].
  const SubWordProviderFamily();

  /// See also [SubWordProvider].
  SubWordProviderProvider call(
    String word,
  ) {
    return SubWordProviderProvider(
      word,
    );
  }

  @override
  SubWordProviderProvider getProviderOverride(
    covariant SubWordProviderProvider provider,
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
  String? get name => r'subWordProviderProvider';
}

/// See also [SubWordProvider].
class SubWordProviderProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SubWordProvider, SubWordWithWords?> {
  /// See also [SubWordProvider].
  SubWordProviderProvider(
    String word,
  ) : this._internal(
          () => SubWordProvider()..word = word,
          from: subWordProviderProvider,
          name: r'subWordProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$subWordProviderHash,
          dependencies: SubWordProviderFamily._dependencies,
          allTransitiveDependencies:
              SubWordProviderFamily._allTransitiveDependencies,
          word: word,
        );

  SubWordProviderProvider._internal(
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
  FutureOr<SubWordWithWords?> runNotifierBuild(
    covariant SubWordProvider notifier,
  ) {
    return notifier.build(
      word,
    );
  }

  @override
  Override overrideWith(SubWordProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: SubWordProviderProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SubWordProvider, SubWordWithWords?>
      createElement() {
    return _SubWordProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubWordProviderProvider && other.word == word;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, word.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubWordProviderRef
    on AutoDisposeAsyncNotifierProviderRef<SubWordWithWords?> {
  /// The parameter `word` of this provider.
  String get word;
}

class _SubWordProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SubWordProvider,
        SubWordWithWords?> with SubWordProviderRef {
  _SubWordProviderProviderElement(super.provider);

  @override
  String get word => (origin as SubWordProviderProvider).word;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
