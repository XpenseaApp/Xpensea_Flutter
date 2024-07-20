// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_helper.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseListHash() => r'acc2c26d47bf4c6d227e6782494f34669493cdf3';

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

/// See also [expenseList].
@ProviderFor(expenseList)
const expenseListProvider = ExpenseListFamily();

/// See also [expenseList].
class ExpenseListFamily extends Family<AsyncValue<List<Expenses>>> {
  /// See also [expenseList].
  const ExpenseListFamily();

  /// See also [expenseList].
  ExpenseListProvider call(
    String token,
    String type,
  ) {
    return ExpenseListProvider(
      token,
      type,
    );
  }

  @override
  ExpenseListProvider getProviderOverride(
    covariant ExpenseListProvider provider,
  ) {
    return call(
      provider.token,
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
  String? get name => r'expenseListProvider';
}

/// See also [expenseList].
class ExpenseListProvider extends AutoDisposeFutureProvider<List<Expenses>> {
  /// See also [expenseList].
  ExpenseListProvider(
    String token,
    String type,
  ) : this._internal(
          (ref) => expenseList(
            ref as ExpenseListRef,
            token,
            type,
          ),
          from: expenseListProvider,
          name: r'expenseListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expenseListHash,
          dependencies: ExpenseListFamily._dependencies,
          allTransitiveDependencies:
              ExpenseListFamily._allTransitiveDependencies,
          token: token,
          type: type,
        );

  ExpenseListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
    required this.type,
  }) : super.internal();

  final String token;
  final String type;

  @override
  Override overrideWith(
    FutureOr<List<Expenses>> Function(ExpenseListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExpenseListProvider._internal(
        (ref) => create(ref as ExpenseListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Expenses>> createElement() {
    return _ExpenseListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpenseListProvider &&
        other.token == token &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExpenseListRef on AutoDisposeFutureProviderRef<List<Expenses>> {
  /// The parameter `token` of this provider.
  String get token;

  /// The parameter `type` of this provider.
  String get type;
}

class _ExpenseListProviderElement
    extends AutoDisposeFutureProviderElement<List<Expenses>>
    with ExpenseListRef {
  _ExpenseListProviderElement(super.provider);

  @override
  String get token => (origin as ExpenseListProvider).token;
  @override
  String get type => (origin as ExpenseListProvider).type;
}

String _$reportListHash() => r'bdf66f0914d35d6e7bae8650a10512c2aceca0d1';

/// See also [reportList].
@ProviderFor(reportList)
const reportListProvider = ReportListFamily();

/// See also [reportList].
class ReportListFamily extends Family<AsyncValue<List<Reports>>> {
  /// See also [reportList].
  const ReportListFamily();

  /// See also [reportList].
  ReportListProvider call(
    String token,
    String type,
  ) {
    return ReportListProvider(
      token,
      type,
    );
  }

  @override
  ReportListProvider getProviderOverride(
    covariant ReportListProvider provider,
  ) {
    return call(
      provider.token,
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
  String? get name => r'reportListProvider';
}

/// See also [reportList].
class ReportListProvider extends AutoDisposeFutureProvider<List<Reports>> {
  /// See also [reportList].
  ReportListProvider(
    String token,
    String type,
  ) : this._internal(
          (ref) => reportList(
            ref as ReportListRef,
            token,
            type,
          ),
          from: reportListProvider,
          name: r'reportListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportListHash,
          dependencies: ReportListFamily._dependencies,
          allTransitiveDependencies:
              ReportListFamily._allTransitiveDependencies,
          token: token,
          type: type,
        );

  ReportListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
    required this.type,
  }) : super.internal();

  final String token;
  final String type;

  @override
  Override overrideWith(
    FutureOr<List<Reports>> Function(ReportListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReportListProvider._internal(
        (ref) => create(ref as ReportListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Reports>> createElement() {
    return _ReportListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReportListProvider &&
        other.token == token &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReportListRef on AutoDisposeFutureProviderRef<List<Reports>> {
  /// The parameter `token` of this provider.
  String get token;

  /// The parameter `type` of this provider.
  String get type;
}

class _ReportListProviderElement
    extends AutoDisposeFutureProviderElement<List<Reports>> with ReportListRef {
  _ReportListProviderElement(super.provider);

  @override
  String get token => (origin as ReportListProvider).token;
  @override
  String get type => (origin as ReportListProvider).type;
}

String _$approversListHash() => r'eb6f215797988f0a792c6d37b3c0824d8fd83f1c';

/// See also [approversList].
@ProviderFor(approversList)
const approversListProvider = ApproversListFamily();

/// See also [approversList].
class ApproversListFamily extends Family<AsyncValue<List<Reports>>> {
  /// See also [approversList].
  const ApproversListFamily();

  /// See also [approversList].
  ApproversListProvider call(
    String token,
    String type,
  ) {
    return ApproversListProvider(
      token,
      type,
    );
  }

  @override
  ApproversListProvider getProviderOverride(
    covariant ApproversListProvider provider,
  ) {
    return call(
      provider.token,
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
  String? get name => r'approversListProvider';
}

/// See also [approversList].
class ApproversListProvider extends AutoDisposeFutureProvider<List<Reports>> {
  /// See also [approversList].
  ApproversListProvider(
    String token,
    String type,
  ) : this._internal(
          (ref) => approversList(
            ref as ApproversListRef,
            token,
            type,
          ),
          from: approversListProvider,
          name: r'approversListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$approversListHash,
          dependencies: ApproversListFamily._dependencies,
          allTransitiveDependencies:
              ApproversListFamily._allTransitiveDependencies,
          token: token,
          type: type,
        );

  ApproversListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
    required this.type,
  }) : super.internal();

  final String token;
  final String type;

  @override
  Override overrideWith(
    FutureOr<List<Reports>> Function(ApproversListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApproversListProvider._internal(
        (ref) => create(ref as ApproversListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Reports>> createElement() {
    return _ApproversListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApproversListProvider &&
        other.token == token &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ApproversListRef on AutoDisposeFutureProviderRef<List<Reports>> {
  /// The parameter `token` of this provider.
  String get token;

  /// The parameter `type` of this provider.
  String get type;
}

class _ApproversListProviderElement
    extends AutoDisposeFutureProviderElement<List<Reports>>
    with ApproversListRef {
  _ApproversListProviderElement(super.provider);

  @override
  String get token => (origin as ApproversListProvider).token;
  @override
  String get type => (origin as ApproversListProvider).type;
}

String _$eventListHash() => r'3a1fcc9ee5a0575151a753d9461cacd8ae33ef41';

/// See also [eventList].
@ProviderFor(eventList)
const eventListProvider = EventListFamily();

/// See also [eventList].
class EventListFamily extends Family<AsyncValue<List<Event>>> {
  /// See also [eventList].
  const EventListFamily();

  /// See also [eventList].
  EventListProvider call(
    String token,
    String type,
  ) {
    return EventListProvider(
      token,
      type,
    );
  }

  @override
  EventListProvider getProviderOverride(
    covariant EventListProvider provider,
  ) {
    return call(
      provider.token,
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
  String? get name => r'eventListProvider';
}

/// See also [eventList].
class EventListProvider extends AutoDisposeFutureProvider<List<Event>> {
  /// See also [eventList].
  EventListProvider(
    String token,
    String type,
  ) : this._internal(
          (ref) => eventList(
            ref as EventListRef,
            token,
            type,
          ),
          from: eventListProvider,
          name: r'eventListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventListHash,
          dependencies: EventListFamily._dependencies,
          allTransitiveDependencies: EventListFamily._allTransitiveDependencies,
          token: token,
          type: type,
        );

  EventListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
    required this.type,
  }) : super.internal();

  final String token;
  final String type;

  @override
  Override overrideWith(
    FutureOr<List<Event>> Function(EventListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EventListProvider._internal(
        (ref) => create(ref as EventListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Event>> createElement() {
    return _EventListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EventListProvider &&
        other.token == token &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EventListRef on AutoDisposeFutureProviderRef<List<Event>> {
  /// The parameter `token` of this provider.
  String get token;

  /// The parameter `type` of this provider.
  String get type;
}

class _EventListProviderElement
    extends AutoDisposeFutureProviderElement<List<Event>> with EventListRef {
  _EventListProviderElement(super.provider);

  @override
  String get token => (origin as EventListProvider).token;
  @override
  String get type => (origin as EventListProvider).type;
}

String _$listControllerHash() => r'f863129e2843f65f1d7d2f66cfd275ca902cbe5d';

/// See also [listController].
@ProviderFor(listController)
const listControllerProvider = ListControllerFamily();

/// See also [listController].
class ListControllerFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [listController].
  const ListControllerFamily();

  /// See also [listController].
  ListControllerProvider call(
    String type,
    int pageNo,
    String token,
  ) {
    return ListControllerProvider(
      type,
      pageNo,
      token,
    );
  }

  @override
  ListControllerProvider getProviderOverride(
    covariant ListControllerProvider provider,
  ) {
    return call(
      provider.type,
      provider.pageNo,
      provider.token,
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
  String? get name => r'listControllerProvider';
}

/// See also [listController].
class ListControllerProvider extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [listController].
  ListControllerProvider(
    String type,
    int pageNo,
    String token,
  ) : this._internal(
          (ref) => listController(
            ref as ListControllerRef,
            type,
            pageNo,
            token,
          ),
          from: listControllerProvider,
          name: r'listControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listControllerHash,
          dependencies: ListControllerFamily._dependencies,
          allTransitiveDependencies:
              ListControllerFamily._allTransitiveDependencies,
          type: type,
          pageNo: pageNo,
          token: token,
        );

  ListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
    required this.pageNo,
    required this.token,
  }) : super.internal();

  final String type;
  final int pageNo;
  final String token;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(ListControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListControllerProvider._internal(
        (ref) => create(ref as ListControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
        pageNo: pageNo,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _ListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListControllerProvider &&
        other.type == type &&
        other.pageNo == pageNo &&
        other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, pageNo.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListControllerRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `type` of this provider.
  String get type;

  /// The parameter `pageNo` of this provider.
  int get pageNo;

  /// The parameter `token` of this provider.
  String get token;
}

class _ListControllerProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with ListControllerRef {
  _ListControllerProviderElement(super.provider);

  @override
  String get type => (origin as ListControllerProvider).type;
  @override
  int get pageNo => (origin as ListControllerProvider).pageNo;
  @override
  String get token => (origin as ListControllerProvider).token;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
