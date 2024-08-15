// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activityNullHash() => r'1693da4935e42ab9543e5f9f695042e1f1417da8';

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

/// 그러면 이 함수의 결과를 캐시할
/// `activityProvider`라는 provider가 생성됩니다.
///
///
/// Copied from [activityNull].
@ProviderFor(activityNull)
const activityNullProvider = ActivityNullFamily();

/// 그러면 이 함수의 결과를 캐시할
/// `activityProvider`라는 provider가 생성됩니다.
///
///
/// Copied from [activityNull].
class ActivityNullFamily extends Family<AsyncValue<Activity?>> {
  /// 그러면 이 함수의 결과를 캐시할
  /// `activityProvider`라는 provider가 생성됩니다.
  ///
  ///
  /// Copied from [activityNull].
  const ActivityNullFamily();

  /// 그러면 이 함수의 결과를 캐시할
  /// `activityProvider`라는 provider가 생성됩니다.
  ///
  ///
  /// Copied from [activityNull].
  ActivityNullProvider call({
    String? arg,
  }) {
    return ActivityNullProvider(
      arg: arg,
    );
  }

  @override
  ActivityNullProvider getProviderOverride(
    covariant ActivityNullProvider provider,
  ) {
    return call(
      arg: provider.arg,
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
  String? get name => r'activityNullProvider';
}

/// 그러면 이 함수의 결과를 캐시할
/// `activityProvider`라는 provider가 생성됩니다.
///
///
/// Copied from [activityNull].
class ActivityNullProvider extends AutoDisposeFutureProvider<Activity?> {
  /// 그러면 이 함수의 결과를 캐시할
  /// `activityProvider`라는 provider가 생성됩니다.
  ///
  ///
  /// Copied from [activityNull].
  ActivityNullProvider({
    String? arg,
  }) : this._internal(
          (ref) => activityNull(
            ref as ActivityNullRef,
            arg: arg,
          ),
          from: activityNullProvider,
          name: r'activityNullProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$activityNullHash,
          dependencies: ActivityNullFamily._dependencies,
          allTransitiveDependencies:
              ActivityNullFamily._allTransitiveDependencies,
          arg: arg,
        );

  ActivityNullProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.arg,
  }) : super.internal();

  final String? arg;

  @override
  Override overrideWith(
    FutureOr<Activity?> Function(ActivityNullRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ActivityNullProvider._internal(
        (ref) => create(ref as ActivityNullRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        arg: arg,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Activity?> createElement() {
    return _ActivityNullProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActivityNullProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ActivityNullRef on AutoDisposeFutureProviderRef<Activity?> {
  /// The parameter `arg` of this provider.
  String? get arg;
}

class _ActivityNullProviderElement
    extends AutoDisposeFutureProviderElement<Activity?> with ActivityNullRef {
  _ActivityNullProviderElement(super.provider);

  @override
  String? get arg => (origin as ActivityNullProvider).arg;
}

String _$activityHash() => r'2151ba039c40e1a5e3b4789346fd258e18196cac';

/// See also [activity].
@ProviderFor(activity)
const activityProvider = ActivityFamily();

/// See also [activity].
class ActivityFamily extends Family<AsyncValue<Activity>> {
  /// See also [activity].
  const ActivityFamily();

  /// See also [activity].
  ActivityProvider call({
    String? arg,
  }) {
    return ActivityProvider(
      arg: arg,
    );
  }

  @override
  ActivityProvider getProviderOverride(
    covariant ActivityProvider provider,
  ) {
    return call(
      arg: provider.arg,
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
  String? get name => r'activityProvider';
}

/// See also [activity].
class ActivityProvider extends AutoDisposeFutureProvider<Activity> {
  /// See also [activity].
  ActivityProvider({
    String? arg,
  }) : this._internal(
          (ref) => activity(
            ref as ActivityRef,
            arg: arg,
          ),
          from: activityProvider,
          name: r'activityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$activityHash,
          dependencies: ActivityFamily._dependencies,
          allTransitiveDependencies: ActivityFamily._allTransitiveDependencies,
          arg: arg,
        );

  ActivityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.arg,
  }) : super.internal();

  final String? arg;

  @override
  Override overrideWith(
    FutureOr<Activity> Function(ActivityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ActivityProvider._internal(
        (ref) => create(ref as ActivityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        arg: arg,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Activity> createElement() {
    return _ActivityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActivityProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ActivityRef on AutoDisposeFutureProviderRef<Activity> {
  /// The parameter `arg` of this provider.
  String? get arg;
}

class _ActivityProviderElement
    extends AutoDisposeFutureProviderElement<Activity> with ActivityRef {
  _ActivityProviderElement(super.provider);

  @override
  String? get arg => (origin as ActivityProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
