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

String _$reportListHash() => r'9b4f70478353e596b8366de223ecc212878fbf6b';

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

String _$eventListHash() => r'1135ce95e69c3e0d3f755380409a58d52830ed43';

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

String _$notificationListHash() => r'3293c02f2eba1dfcdb76b1a9a6bc989d49d473b6';

/// See also [notificationList].
@ProviderFor(notificationList)
const notificationListProvider = NotificationListFamily();

/// See also [notificationList].
class NotificationListFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [notificationList].
  const NotificationListFamily();

  /// See also [notificationList].
  NotificationListProvider call(
    String token,
  ) {
    return NotificationListProvider(
      token,
    );
  }

  @override
  NotificationListProvider getProviderOverride(
    covariant NotificationListProvider provider,
  ) {
    return call(
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
  String? get name => r'notificationListProvider';
}

/// See also [notificationList].
class NotificationListProvider
    extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [notificationList].
  NotificationListProvider(
    String token,
  ) : this._internal(
          (ref) => notificationList(
            ref as NotificationListRef,
            token,
          ),
          from: notificationListProvider,
          name: r'notificationListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$notificationListHash,
          dependencies: NotificationListFamily._dependencies,
          allTransitiveDependencies:
              NotificationListFamily._allTransitiveDependencies,
          token: token,
        );

  NotificationListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final String token;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(NotificationListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NotificationListProvider._internal(
        (ref) => create(ref as NotificationListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _NotificationListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationListProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NotificationListRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `token` of this provider.
  String get token;
}

class _NotificationListProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with NotificationListRef {
  _NotificationListProviderElement(super.provider);

  @override
  String get token => (origin as NotificationListProvider).token;
}

String _$getExpenseHash() => r'cabe4824521e7f7d134d212da861de1c1112a283';

/// See also [getExpense].
@ProviderFor(getExpense)
const getExpenseProvider = GetExpenseFamily();

/// See also [getExpense].
class GetExpenseFamily extends Family<AsyncValue<Expenses>> {
  /// See also [getExpense].
  const GetExpenseFamily();

  /// See also [getExpense].
  GetExpenseProvider call(
    String id,
    String token,
  ) {
    return GetExpenseProvider(
      id,
      token,
    );
  }

  @override
  GetExpenseProvider getProviderOverride(
    covariant GetExpenseProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getExpenseProvider';
}

/// See also [getExpense].
class GetExpenseProvider extends AutoDisposeFutureProvider<Expenses> {
  /// See also [getExpense].
  GetExpenseProvider(
    String id,
    String token,
  ) : this._internal(
          (ref) => getExpense(
            ref as GetExpenseRef,
            id,
            token,
          ),
          from: getExpenseProvider,
          name: r'getExpenseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getExpenseHash,
          dependencies: GetExpenseFamily._dependencies,
          allTransitiveDependencies:
              GetExpenseFamily._allTransitiveDependencies,
          id: id,
          token: token,
        );

  GetExpenseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.token,
  }) : super.internal();

  final String id;
  final String token;

  @override
  Override overrideWith(
    FutureOr<Expenses> Function(GetExpenseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetExpenseProvider._internal(
        (ref) => create(ref as GetExpenseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Expenses> createElement() {
    return _GetExpenseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetExpenseProvider &&
        other.id == id &&
        other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetExpenseRef on AutoDisposeFutureProviderRef<Expenses> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `token` of this provider.
  String get token;
}

class _GetExpenseProviderElement
    extends AutoDisposeFutureProviderElement<Expenses> with GetExpenseRef {
  _GetExpenseProviderElement(super.provider);

  @override
  String get id => (origin as GetExpenseProvider).id;
  @override
  String get token => (origin as GetExpenseProvider).token;
}

String _$getReportHash() => r'8349739ce62da156f9abf11f3b414f419788ad58';

/// See also [getReport].
@ProviderFor(getReport)
const getReportProvider = GetReportFamily();

/// See also [getReport].
class GetReportFamily extends Family<AsyncValue<dynamic>> {
  /// See also [getReport].
  const GetReportFamily();

  /// See also [getReport].
  GetReportProvider call(
    String id,
    String? isEvent,
    String token,
  ) {
    return GetReportProvider(
      id,
      isEvent,
      token,
    );
  }

  @override
  GetReportProvider getProviderOverride(
    covariant GetReportProvider provider,
  ) {
    return call(
      provider.id,
      provider.isEvent,
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
  String? get name => r'getReportProvider';
}

/// See also [getReport].
class GetReportProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [getReport].
  GetReportProvider(
    String id,
    String? isEvent,
    String token,
  ) : this._internal(
          (ref) => getReport(
            ref as GetReportRef,
            id,
            isEvent,
            token,
          ),
          from: getReportProvider,
          name: r'getReportProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getReportHash,
          dependencies: GetReportFamily._dependencies,
          allTransitiveDependencies: GetReportFamily._allTransitiveDependencies,
          id: id,
          isEvent: isEvent,
          token: token,
        );

  GetReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.isEvent,
    required this.token,
  }) : super.internal();

  final String id;
  final String? isEvent;
  final String token;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(GetReportRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetReportProvider._internal(
        (ref) => create(ref as GetReportRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        isEvent: isEvent,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _GetReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetReportProvider &&
        other.id == id &&
        other.isEvent == isEvent &&
        other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, isEvent.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetReportRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `isEvent` of this provider.
  String? get isEvent;

  /// The parameter `token` of this provider.
  String get token;
}

class _GetReportProviderElement
    extends AutoDisposeFutureProviderElement<dynamic> with GetReportRef {
  _GetReportProviderElement(super.provider);

  @override
  String get id => (origin as GetReportProvider).id;
  @override
  String? get isEvent => (origin as GetReportProvider).isEvent;
  @override
  String get token => (origin as GetReportProvider).token;
}

String _$getApprovalHash() => r'e35f3586964bbbc2d2d5a23f2cd87d7bf226d16f';

/// See also [getApproval].
@ProviderFor(getApproval)
const getApprovalProvider = GetApprovalFamily();

/// See also [getApproval].
class GetApprovalFamily extends Family<AsyncValue<dynamic>> {
  /// See also [getApproval].
  const GetApprovalFamily();

  /// See also [getApproval].
  GetApprovalProvider call(
    String id,
    String token,
  ) {
    return GetApprovalProvider(
      id,
      token,
    );
  }

  @override
  GetApprovalProvider getProviderOverride(
    covariant GetApprovalProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getApprovalProvider';
}

/// See also [getApproval].
class GetApprovalProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [getApproval].
  GetApprovalProvider(
    String id,
    String token,
  ) : this._internal(
          (ref) => getApproval(
            ref as GetApprovalRef,
            id,
            token,
          ),
          from: getApprovalProvider,
          name: r'getApprovalProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getApprovalHash,
          dependencies: GetApprovalFamily._dependencies,
          allTransitiveDependencies:
              GetApprovalFamily._allTransitiveDependencies,
          id: id,
          token: token,
        );

  GetApprovalProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.token,
  }) : super.internal();

  final String id;
  final String token;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(GetApprovalRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetApprovalProvider._internal(
        (ref) => create(ref as GetApprovalRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _GetApprovalProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetApprovalProvider &&
        other.id == id &&
        other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetApprovalRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `token` of this provider.
  String get token;
}

class _GetApprovalProviderElement
    extends AutoDisposeFutureProviderElement<dynamic> with GetApprovalRef {
  _GetApprovalProviderElement(super.provider);

  @override
  String get id => (origin as GetApprovalProvider).id;
  @override
  String get token => (origin as GetApprovalProvider).token;
}

String _$getCatagoriesHash() => r'f900c7b7f902d48f92a87b262f64fedae1b1b6c1';

/// See also [getCatagories].
@ProviderFor(getCatagories)
const getCatagoriesProvider = GetCatagoriesFamily();

/// See also [getCatagories].
class GetCatagoriesFamily extends Family<AsyncValue<List<String>>> {
  /// See also [getCatagories].
  const GetCatagoriesFamily();

  /// See also [getCatagories].
  GetCatagoriesProvider call(
    String token,
  ) {
    return GetCatagoriesProvider(
      token,
    );
  }

  @override
  GetCatagoriesProvider getProviderOverride(
    covariant GetCatagoriesProvider provider,
  ) {
    return call(
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
  String? get name => r'getCatagoriesProvider';
}

/// See also [getCatagories].
class GetCatagoriesProvider extends AutoDisposeFutureProvider<List<String>> {
  /// See also [getCatagories].
  GetCatagoriesProvider(
    String token,
  ) : this._internal(
          (ref) => getCatagories(
            ref as GetCatagoriesRef,
            token,
          ),
          from: getCatagoriesProvider,
          name: r'getCatagoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCatagoriesHash,
          dependencies: GetCatagoriesFamily._dependencies,
          allTransitiveDependencies:
              GetCatagoriesFamily._allTransitiveDependencies,
          token: token,
        );

  GetCatagoriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final String token;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(GetCatagoriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCatagoriesProvider._internal(
        (ref) => create(ref as GetCatagoriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _GetCatagoriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCatagoriesProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCatagoriesRef on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `token` of this provider.
  String get token;
}

class _GetCatagoriesProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with GetCatagoriesRef {
  _GetCatagoriesProviderElement(super.provider);

  @override
  String get token => (origin as GetCatagoriesProvider).token;
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

String _$getWalletHash() => r'e5e490d5aaf8ca4d736b675766090662fc88183a';

/// See also [getWallet].
@ProviderFor(getWallet)
const getWalletProvider = GetWalletFamily();

/// See also [getWallet].
class GetWalletFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [getWallet].
  const GetWalletFamily();

  /// See also [getWallet].
  GetWalletProvider call(
    String token,
  ) {
    return GetWalletProvider(
      token,
    );
  }

  @override
  GetWalletProvider getProviderOverride(
    covariant GetWalletProvider provider,
  ) {
    return call(
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
  String? get name => r'getWalletProvider';
}

/// See also [getWallet].
class GetWalletProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [getWallet].
  GetWalletProvider(
    String token,
  ) : this._internal(
          (ref) => getWallet(
            ref as GetWalletRef,
            token,
          ),
          from: getWalletProvider,
          name: r'getWalletProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getWalletHash,
          dependencies: GetWalletFamily._dependencies,
          allTransitiveDependencies: GetWalletFamily._allTransitiveDependencies,
          token: token,
        );

  GetWalletProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final String token;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(GetWalletRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetWalletProvider._internal(
        (ref) => create(ref as GetWalletRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _GetWalletProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetWalletProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetWalletRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `token` of this provider.
  String get token;
}

class _GetWalletProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with GetWalletRef {
  _GetWalletProviderElement(super.provider);

  @override
  String get token => (origin as GetWalletProvider).token;
}

String _$getPolicyHash() => r'9f276d9dba33dcaaa71de268f77c34e8be14c387';

/// See also [getPolicy].
@ProviderFor(getPolicy)
const getPolicyProvider = GetPolicyFamily();

/// See also [getPolicy].
class GetPolicyFamily extends Family<AsyncValue<dynamic>> {
  /// See also [getPolicy].
  const GetPolicyFamily();

  /// See also [getPolicy].
  GetPolicyProvider call(
    String token,
  ) {
    return GetPolicyProvider(
      token,
    );
  }

  @override
  GetPolicyProvider getProviderOverride(
    covariant GetPolicyProvider provider,
  ) {
    return call(
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
  String? get name => r'getPolicyProvider';
}

/// See also [getPolicy].
class GetPolicyProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [getPolicy].
  GetPolicyProvider(
    String token,
  ) : this._internal(
          (ref) => getPolicy(
            ref as GetPolicyRef,
            token,
          ),
          from: getPolicyProvider,
          name: r'getPolicyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPolicyHash,
          dependencies: GetPolicyFamily._dependencies,
          allTransitiveDependencies: GetPolicyFamily._allTransitiveDependencies,
          token: token,
        );

  GetPolicyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final String token;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(GetPolicyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPolicyProvider._internal(
        (ref) => create(ref as GetPolicyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _GetPolicyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPolicyProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPolicyRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `token` of this provider.
  String get token;
}

class _GetPolicyProviderElement
    extends AutoDisposeFutureProviderElement<dynamic> with GetPolicyRef {
  _GetPolicyProviderElement(super.provider);

  @override
  String get token => (origin as GetPolicyProvider).token;
}

String _$saveLocationHash() => r'e11c10349606864ecbc6dcaee2839c47c34d040a';

/// See also [saveLocation].
@ProviderFor(saveLocation)
const saveLocationProvider = SaveLocationFamily();

/// See also [saveLocation].
class SaveLocationFamily extends Family<AsyncValue<dynamic>> {
  /// See also [saveLocation].
  const SaveLocationFamily();

  /// See also [saveLocation].
  SaveLocationProvider call(
    String eventName,
    String? eventId,
    String token,
  ) {
    return SaveLocationProvider(
      eventName,
      eventId,
      token,
    );
  }

  @override
  SaveLocationProvider getProviderOverride(
    covariant SaveLocationProvider provider,
  ) {
    return call(
      provider.eventName,
      provider.eventId,
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
  String? get name => r'saveLocationProvider';
}

/// See also [saveLocation].
class SaveLocationProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [saveLocation].
  SaveLocationProvider(
    String eventName,
    String? eventId,
    String token,
  ) : this._internal(
          (ref) => saveLocation(
            ref as SaveLocationRef,
            eventName,
            eventId,
            token,
          ),
          from: saveLocationProvider,
          name: r'saveLocationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveLocationHash,
          dependencies: SaveLocationFamily._dependencies,
          allTransitiveDependencies:
              SaveLocationFamily._allTransitiveDependencies,
          eventName: eventName,
          eventId: eventId,
          token: token,
        );

  SaveLocationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventName,
    required this.eventId,
    required this.token,
  }) : super.internal();

  final String eventName;
  final String? eventId;
  final String token;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(SaveLocationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveLocationProvider._internal(
        (ref) => create(ref as SaveLocationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventName: eventName,
        eventId: eventId,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _SaveLocationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveLocationProvider &&
        other.eventName == eventName &&
        other.eventId == eventId &&
        other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventName.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveLocationRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `eventName` of this provider.
  String get eventName;

  /// The parameter `eventId` of this provider.
  String? get eventId;

  /// The parameter `token` of this provider.
  String get token;
}

class _SaveLocationProviderElement
    extends AutoDisposeFutureProviderElement<dynamic> with SaveLocationRef {
  _SaveLocationProviderElement(super.provider);

  @override
  String get eventName => (origin as SaveLocationProvider).eventName;
  @override
  String? get eventId => (origin as SaveLocationProvider).eventId;
  @override
  String get token => (origin as SaveLocationProvider).token;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
