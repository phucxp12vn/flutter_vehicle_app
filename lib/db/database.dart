import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
part 'database.g.dart';

class LoginStates extends Table {
  BoolColumn get isLoggedIn => boolean()();
}

class CountStates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get itemId => text()();
  IntColumn get clickCount => integer()();
}

@DriftDatabase(tables: [LoginStates, CountStates])
class AppDatabase extends _$AppDatabase {
  AppDatabase._() : super(_openConnection());
  static final AppDatabase instance = AppDatabase._();

  @override
  int get schemaVersion => 2;

  // LoginStates related functions
  Future<int> insertLoginState(LoginStatesCompanion loginState) =>
      into(loginStates).insert(loginState);

  Future<bool> checkLoginState() async {
    final result = await (select(loginStates)..limit(1)).getSingleOrNull();
    return result?.isLoggedIn ?? false;
  }

  Future<int> clearLoginState() => delete(loginStates).go();

  // CountStates related functions
  Future<void> incrementItemClick(String itemId) async {
    final existingItem = await _getExistingItem(itemId);
    if (existingItem != null) {
      await _updateExistingItem(itemId, existingItem.clickCount);
    } else {
      await _insertNewItem(itemId);
    }
  }

  Future<int> getItemClickCount(String itemId) async {
    final result = await _getExistingItem(itemId);
    return result?.clickCount ?? 0;
  }

  // Helper functions for CountStates
  Future<CountState?> _getExistingItem(String itemId) async {
    return await (select(countStates)
          ..where((tbl) => tbl.itemId.equals(itemId)))
        .getSingleOrNull();
  }

  Future<void> _updateExistingItem(String itemId, int currentCount) async {
    await (update(countStates)..where((tbl) => tbl.itemId.equals(itemId)))
        .write(CountStatesCompanion(clickCount: Value(currentCount + 1)));
  }

  Future<void> _insertNewItem(String itemId) async {
    await into(countStates).insert(CountStatesCompanion.insert(
      itemId: itemId,
      clickCount: 1,
    ));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return driftDatabase(name: 'my_database');
  });
}
