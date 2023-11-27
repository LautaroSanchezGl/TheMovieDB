// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moviesControllerHash() => r'fdd88b9fc7379ea856b0589c8c261f8c27787acf';

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

abstract class _$MoviesController
    extends BuildlessAutoDisposeAsyncNotifier<List<Movie>> {
  late final Endpoint endpoint;

  FutureOr<List<Movie>> build(
    Endpoint endpoint,
  );
}

/// See also [MoviesController].
@ProviderFor(MoviesController)
const moviesControllerProvider = MoviesControllerFamily();

/// See also [MoviesController].
class MoviesControllerFamily extends Family<AsyncValue<List<Movie>>> {
  /// See also [MoviesController].
  const MoviesControllerFamily();

  /// See also [MoviesController].
  MoviesControllerProvider call(
    Endpoint endpoint,
  ) {
    return MoviesControllerProvider(
      endpoint,
    );
  }

  @override
  MoviesControllerProvider getProviderOverride(
    covariant MoviesControllerProvider provider,
  ) {
    return call(
      provider.endpoint,
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
  String? get name => r'moviesControllerProvider';
}

/// See also [MoviesController].
class MoviesControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MoviesController, List<Movie>> {
  /// See also [MoviesController].
  MoviesControllerProvider(
    Endpoint endpoint,
  ) : this._internal(
          () => MoviesController()..endpoint = endpoint,
          from: moviesControllerProvider,
          name: r'moviesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$moviesControllerHash,
          dependencies: MoviesControllerFamily._dependencies,
          allTransitiveDependencies:
              MoviesControllerFamily._allTransitiveDependencies,
          endpoint: endpoint,
        );

  MoviesControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.endpoint,
  }) : super.internal();

  final Endpoint endpoint;

  @override
  FutureOr<List<Movie>> runNotifierBuild(
    covariant MoviesController notifier,
  ) {
    return notifier.build(
      endpoint,
    );
  }

  @override
  Override overrideWith(MoviesController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MoviesControllerProvider._internal(
        () => create()..endpoint = endpoint,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        endpoint: endpoint,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MoviesController, List<Movie>>
      createElement() {
    return _MoviesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MoviesControllerProvider && other.endpoint == endpoint;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, endpoint.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MoviesControllerRef on AutoDisposeAsyncNotifierProviderRef<List<Movie>> {
  /// The parameter `endpoint` of this provider.
  Endpoint get endpoint;
}

class _MoviesControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MoviesController,
        List<Movie>> with MoviesControllerRef {
  _MoviesControllerProviderElement(super.provider);

  @override
  Endpoint get endpoint => (origin as MoviesControllerProvider).endpoint;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
