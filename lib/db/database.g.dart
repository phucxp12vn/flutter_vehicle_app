// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LoginStatesTable extends LoginStates
    with TableInfo<$LoginStatesTable, LoginState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoginStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _isLoggedInMeta =
      const VerificationMeta('isLoggedIn');
  @override
  late final GeneratedColumn<bool> isLoggedIn = GeneratedColumn<bool>(
      'is_logged_in', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_logged_in" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [isLoggedIn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'login_states';
  @override
  VerificationContext validateIntegrity(Insertable<LoginState> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('is_logged_in')) {
      context.handle(
          _isLoggedInMeta,
          isLoggedIn.isAcceptableOrUnknown(
              data['is_logged_in']!, _isLoggedInMeta));
    } else if (isInserting) {
      context.missing(_isLoggedInMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LoginState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoginState(
      isLoggedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_logged_in'])!,
    );
  }

  @override
  $LoginStatesTable createAlias(String alias) {
    return $LoginStatesTable(attachedDatabase, alias);
  }
}

class LoginState extends DataClass implements Insertable<LoginState> {
  final bool isLoggedIn;
  const LoginState({required this.isLoggedIn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['is_logged_in'] = Variable<bool>(isLoggedIn);
    return map;
  }

  LoginStatesCompanion toCompanion(bool nullToAbsent) {
    return LoginStatesCompanion(
      isLoggedIn: Value(isLoggedIn),
    );
  }

  factory LoginState.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoginState(
      isLoggedIn: serializer.fromJson<bool>(json['isLoggedIn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'isLoggedIn': serializer.toJson<bool>(isLoggedIn),
    };
  }

  LoginState copyWith({bool? isLoggedIn}) => LoginState(
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      );
  LoginState copyWithCompanion(LoginStatesCompanion data) {
    return LoginState(
      isLoggedIn:
          data.isLoggedIn.present ? data.isLoggedIn.value : this.isLoggedIn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoginState(')
          ..write('isLoggedIn: $isLoggedIn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => isLoggedIn.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginState && other.isLoggedIn == this.isLoggedIn);
}

class LoginStatesCompanion extends UpdateCompanion<LoginState> {
  final Value<bool> isLoggedIn;
  final Value<int> rowid;
  const LoginStatesCompanion({
    this.isLoggedIn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LoginStatesCompanion.insert({
    required bool isLoggedIn,
    this.rowid = const Value.absent(),
  }) : isLoggedIn = Value(isLoggedIn);
  static Insertable<LoginState> custom({
    Expression<bool>? isLoggedIn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (isLoggedIn != null) 'is_logged_in': isLoggedIn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LoginStatesCompanion copyWith({Value<bool>? isLoggedIn, Value<int>? rowid}) {
    return LoginStatesCompanion(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (isLoggedIn.present) {
      map['is_logged_in'] = Variable<bool>(isLoggedIn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoginStatesCompanion(')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CountStatesTable extends CountStates
    with TableInfo<$CountStatesTable, CountState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _clickCountMeta =
      const VerificationMeta('clickCount');
  @override
  late final GeneratedColumn<int> clickCount = GeneratedColumn<int>(
      'click_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, itemId, clickCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'count_states';
  @override
  VerificationContext validateIntegrity(Insertable<CountState> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('click_count')) {
      context.handle(
          _clickCountMeta,
          clickCount.isAcceptableOrUnknown(
              data['click_count']!, _clickCountMeta));
    } else if (isInserting) {
      context.missing(_clickCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CountState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountState(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      clickCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}click_count'])!,
    );
  }

  @override
  $CountStatesTable createAlias(String alias) {
    return $CountStatesTable(attachedDatabase, alias);
  }
}

class CountState extends DataClass implements Insertable<CountState> {
  final int id;
  final String itemId;
  final int clickCount;
  const CountState(
      {required this.id, required this.itemId, required this.clickCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_id'] = Variable<String>(itemId);
    map['click_count'] = Variable<int>(clickCount);
    return map;
  }

  CountStatesCompanion toCompanion(bool nullToAbsent) {
    return CountStatesCompanion(
      id: Value(id),
      itemId: Value(itemId),
      clickCount: Value(clickCount),
    );
  }

  factory CountState.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountState(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      clickCount: serializer.fromJson<int>(json['clickCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<String>(itemId),
      'clickCount': serializer.toJson<int>(clickCount),
    };
  }

  CountState copyWith({int? id, String? itemId, int? clickCount}) => CountState(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        clickCount: clickCount ?? this.clickCount,
      );
  CountState copyWithCompanion(CountStatesCompanion data) {
    return CountState(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      clickCount:
          data.clickCount.present ? data.clickCount.value : this.clickCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountState(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('clickCount: $clickCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, clickCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountState &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.clickCount == this.clickCount);
}

class CountStatesCompanion extends UpdateCompanion<CountState> {
  final Value<int> id;
  final Value<String> itemId;
  final Value<int> clickCount;
  const CountStatesCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.clickCount = const Value.absent(),
  });
  CountStatesCompanion.insert({
    this.id = const Value.absent(),
    required String itemId,
    required int clickCount,
  })  : itemId = Value(itemId),
        clickCount = Value(clickCount);
  static Insertable<CountState> custom({
    Expression<int>? id,
    Expression<String>? itemId,
    Expression<int>? clickCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (clickCount != null) 'click_count': clickCount,
    });
  }

  CountStatesCompanion copyWith(
      {Value<int>? id, Value<String>? itemId, Value<int>? clickCount}) {
    return CountStatesCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      clickCount: clickCount ?? this.clickCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (clickCount.present) {
      map['click_count'] = Variable<int>(clickCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountStatesCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('clickCount: $clickCount')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LoginStatesTable loginStates = $LoginStatesTable(this);
  late final $CountStatesTable countStates = $CountStatesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [loginStates, countStates];
}

typedef $$LoginStatesTableCreateCompanionBuilder = LoginStatesCompanion
    Function({
  required bool isLoggedIn,
  Value<int> rowid,
});
typedef $$LoginStatesTableUpdateCompanionBuilder = LoginStatesCompanion
    Function({
  Value<bool> isLoggedIn,
  Value<int> rowid,
});

class $$LoginStatesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $LoginStatesTable> {
  $$LoginStatesTableFilterComposer(super.$state);
  ColumnFilters<bool> get isLoggedIn => $state.composableBuilder(
      column: $state.table.isLoggedIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$LoginStatesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $LoginStatesTable> {
  $$LoginStatesTableOrderingComposer(super.$state);
  ColumnOrderings<bool> get isLoggedIn => $state.composableBuilder(
      column: $state.table.isLoggedIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$LoginStatesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LoginStatesTable,
    LoginState,
    $$LoginStatesTableFilterComposer,
    $$LoginStatesTableOrderingComposer,
    $$LoginStatesTableCreateCompanionBuilder,
    $$LoginStatesTableUpdateCompanionBuilder,
    (LoginState, BaseReferences<_$AppDatabase, $LoginStatesTable, LoginState>),
    LoginState,
    PrefetchHooks Function()> {
  $$LoginStatesTableTableManager(_$AppDatabase db, $LoginStatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$LoginStatesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$LoginStatesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<bool> isLoggedIn = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LoginStatesCompanion(
            isLoggedIn: isLoggedIn,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required bool isLoggedIn,
            Value<int> rowid = const Value.absent(),
          }) =>
              LoginStatesCompanion.insert(
            isLoggedIn: isLoggedIn,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LoginStatesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LoginStatesTable,
    LoginState,
    $$LoginStatesTableFilterComposer,
    $$LoginStatesTableOrderingComposer,
    $$LoginStatesTableCreateCompanionBuilder,
    $$LoginStatesTableUpdateCompanionBuilder,
    (LoginState, BaseReferences<_$AppDatabase, $LoginStatesTable, LoginState>),
    LoginState,
    PrefetchHooks Function()>;
typedef $$CountStatesTableCreateCompanionBuilder = CountStatesCompanion
    Function({
  Value<int> id,
  required String itemId,
  required int clickCount,
});
typedef $$CountStatesTableUpdateCompanionBuilder = CountStatesCompanion
    Function({
  Value<int> id,
  Value<String> itemId,
  Value<int> clickCount,
});

class $$CountStatesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CountStatesTable> {
  $$CountStatesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get clickCount => $state.composableBuilder(
      column: $state.table.clickCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CountStatesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CountStatesTable> {
  $$CountStatesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get clickCount => $state.composableBuilder(
      column: $state.table.clickCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$CountStatesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CountStatesTable,
    CountState,
    $$CountStatesTableFilterComposer,
    $$CountStatesTableOrderingComposer,
    $$CountStatesTableCreateCompanionBuilder,
    $$CountStatesTableUpdateCompanionBuilder,
    (CountState, BaseReferences<_$AppDatabase, $CountStatesTable, CountState>),
    CountState,
    PrefetchHooks Function()> {
  $$CountStatesTableTableManager(_$AppDatabase db, $CountStatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CountStatesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CountStatesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<int> clickCount = const Value.absent(),
          }) =>
              CountStatesCompanion(
            id: id,
            itemId: itemId,
            clickCount: clickCount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String itemId,
            required int clickCount,
          }) =>
              CountStatesCompanion.insert(
            id: id,
            itemId: itemId,
            clickCount: clickCount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CountStatesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CountStatesTable,
    CountState,
    $$CountStatesTableFilterComposer,
    $$CountStatesTableOrderingComposer,
    $$CountStatesTableCreateCompanionBuilder,
    $$CountStatesTableUpdateCompanionBuilder,
    (CountState, BaseReferences<_$AppDatabase, $CountStatesTable, CountState>),
    CountState,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LoginStatesTableTableManager get loginStates =>
      $$LoginStatesTableTableManager(_db, _db.loginStates);
  $$CountStatesTableTableManager get countStates =>
      $$CountStatesTableTableManager(_db, _db.countStates);
}
