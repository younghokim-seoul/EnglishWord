// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteProviderHash() => r'00cbac7abcbe080d1a74e5464edfb17c38a1adec';

/// See also [FavoriteProvider].
@ProviderFor(FavoriteProvider)
final favoriteProviderProvider =
    AutoDisposeNotifierProvider<FavoriteProvider, List<DeepWordInfo>>.internal(
  FavoriteProvider.new,
  name: r'favoriteProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoriteProvider = AutoDisposeNotifier<List<DeepWordInfo>>;
String _$blurProviderHash() => r'1f59eb00f26cc6151964f0f2fdc72d2e32c0f40b';

/// See also [BlurProvider].
@ProviderFor(BlurProvider)
final blurProviderProvider =
    NotifierProvider<BlurProvider, List<DeepWordInfo>>.internal(
  BlurProvider.new,
  name: r'blurProviderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$blurProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BlurProvider = Notifier<List<DeepWordInfo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
