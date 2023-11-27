// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_genres_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieGenresControllerHash() =>
    r'ee37ed29cf1e3d1b321acfa93d224964012f03d0';

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

abstract class _$MovieGenresController
    extends BuildlessAutoDisposeAsyncNotifier<List<Genre>> {
  late final List<int> ids;

  FutureOr<List<Genre>> build(
    List<int> ids,
  );
}

/// See also [MovieGenresController].
@ProviderFor(MovieGenresController)
const movieGenresControllerProvider = MovieGenresControllerFamily();

/// See also [MovieGenresController].
class MovieGenresControllerFamily extends Family<AsyncValue<List<Genre>>> {
  /// See also [MovieGenresController].
  const MovieGenresControllerFamily();

  /// See also [MovieGenresController].
  MovieGenresControllerProvider call(
    List<int> ids,
  ) {
    return MovieGenresControllerProvider(
      ids,
    );
  }

  @override
  MovieGenresControllerProvider getProviderOverride(
    covariant MovieGenresControllerProvider provider,
  ) {
    return call(
      provider.ids,
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
  String? get name => r'movieGenresControllerProvider';
}

/// See also [MovieGenresController].
class MovieGenresControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MovieGenresController,
        List<Genre>> {
  /// See also [MovieGenresController].
  MovieGenresControllerProvider(
    List<int> ids,
  ) : this._internal(
          () => MovieGenresController()..ids = ids,
          from: movieGenresControllerProvider,
          name: r'movieGenresControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieGenresControllerHash,
          dependencies: MovieGenresControllerFamily._dependencies,
          allTransitiveDependencies:
              MovieGenresControllerFamily._allTransitiveDependencies,
          ids: ids,
        );

  MovieGenresControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ids,
  }) : super.internal();

  final List<int> ids;

  @override
  FutureOr<List<Genre>> runNotifierBuild(
    covariant MovieGenresController notifier,
  ) {
    return notifier.build(
      ids,
    );
  }

  @override
  Override overrideWith(MovieGenresController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MovieGenresControllerProvider._internal(
        () => create()..ids = ids,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ids: ids,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MovieGenresController, List<Genre>>
      createElement() {
    return _MovieGenresControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieGenresControllerProvider && other.ids == ids;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ids.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MovieGenresControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Genre>> {
  /// The parameter `ids` of this provider.
  List<int> get ids;
}

class _MovieGenresControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MovieGenresController,
        List<Genre>> with MovieGenresControllerRef {
  _MovieGenresControllerProviderElement(super.provider);

  @override
  List<int> get ids => (origin as MovieGenresControllerProvider).ids;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
