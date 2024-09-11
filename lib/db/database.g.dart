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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LoginStatesTable loginStates = $LoginStatesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [loginStates];
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LoginStatesTableTableManager get loginStates =>
      $$LoginStatesTableTableManager(_db, _db.loginStates);
}
