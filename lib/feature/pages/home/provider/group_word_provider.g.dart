// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_word_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupWordProviderHash() => r'5a09c027b419d25b6d44e0e8c76968b89456899f';

/// See also [GroupWordProvider].
@ProviderFor(GroupWordProvider)
final groupWordProviderProvider =
    AsyncNotifierProvider<GroupWordProvider, List<WordWithWords>>.internal(
  GroupWordProvider.new,
  name: r'groupWordProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupWordProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GroupWordProvider = AsyncNotifier<List<WordWithWords>>;
String _$filteredGroupWordHash() => r'0e3d6148a4fff4d33c78a600c60344df262001ab';

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

abstract class _$FilteredGroupWord
    extends BuildlessAutoDisposeAsyncNotifier<WordWithWords> {
  late final WordBoardTabType type;

  FutureOr<WordWithWords> build(
    WordBoardTabType type,
  );
}

/// See also [FilteredGroupWord].
@ProviderFor(FilteredGroupWord)
const filteredGroupWordProvider = FilteredGroupWordFamily();

/// See also [FilteredGroupWord].
class FilteredGroupWordFamily extends Family<AsyncValue<WordWithWords>> {
  /// See also [FilteredGroupWord].
  const FilteredGroupWordFamily();

  /// See also [FilteredGroupWord].
  FilteredGroupWordProvider call(
    WordBoardTabType type,
  ) {
    return FilteredGroupWordProvider(
      type,
    );
  }

  @override
  FilteredGroupWordProvider getProviderOverride(
    covariant FilteredGroupWordProvider provider,
  ) {
    return call(
      provider.type,
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
  String? get name => r'filteredGroupWordProvider';
}

/// See also [FilteredGroupWord].
class FilteredGroupWordProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FilteredGroupWord, WordWithWords> {
  /// See also [FilteredGroupWord].
  FilteredGroupWordProvider(
    WordBoardTabType type,
  ) : this._internal(
          () => FilteredGroupWord()..type = type,
          from: filteredGroupWordProvider,
          name: r'filteredGroupWordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredGroupWordHash,
          dependencies: FilteredGroupWordFamily._dependencies,
          allTransitiveDependencies:
              FilteredGroupWordFamily._allTransitiveDependencies,
          type: type,
        );

  FilteredGroupWordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final WordBoardTabType type;

  @override
  FutureOr<WordWithWords> runNotifierBuild(
    covariant FilteredGroupWord notifier,
  ) {
    return notifier.build(
      type,
    );
  }

  @override
  Override overrideWith(FilteredGroupWord Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilteredGroupWordProvider._internal(
        () => create()..type = type,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FilteredGroupWord, WordWithWords>
      createElement() {
    return _FilteredGroupWordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredGroupWordProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FilteredGroupWordRef
    on AutoDisposeAsyncNotifierProviderRef<WordWithWords> {
  /// The parameter `type` of this provider.
  WordBoardTabType get type;
}

class _FilteredGroupWordProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FilteredGroupWord,
        WordWithWords> with FilteredGroupWordRef {
  _FilteredGroupWordProviderElement(super.provider);

  @override
  WordBoardTabType get type => (origin as FilteredGroupWordProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
