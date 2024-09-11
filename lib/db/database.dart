import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
part 'database.g.dart';

class LoginStates extends Table {
  BoolColumn get isLoggedIn => boolean()();
}

@DriftDatabase(tables: [LoginStates])
class AppDatabase extends _$AppDatabase {
  AppDatabase._() : super(_openConnection());
  static final AppDatabase instance = AppDatabase._();

  @override
  int get schemaVersion => 1;

  Future<int> insertLoginState(LoginStatesCompanion loginState) =>
      into(loginStates).insert(loginState);

  Future<bool> checkLoginState() async {
    final result = await (select(loginStates)..limit(1)).getSingleOrNull();
    return result?.isLoggedIn ?? false;
  }

  Future<int> clearLoginState() async {
    return await (delete(loginStates)).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return driftDatabase(name: 'my_database');
  });
}
