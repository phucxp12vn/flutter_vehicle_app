import '../actions/count.dart';
import '../../db/database_v2.dart';

class CountState {
  final Map<CountCategory, int> counts;

  CountState({
    Map<CountCategory, int>? counts,
  }) : counts = counts ?? {};

  static Future<CountState> initial() async {
    final database = AppDatabase.instance;
    Map<CountCategory, int> initialCounts = {};

    for (var category in CountCategory.values) {
      int count =
          await database.getItemClickCount(category.toString().split('.')[1]);
      initialCounts[category] = count;
    }

    return CountState(counts: initialCounts);
  }

  CountState copyWith({
    Map<CountCategory, int>? counts,
  }) {
    return CountState(
      counts: counts ?? this.counts,
    );
  }

  int getCount(CountCategory category) => counts[category] ?? 0;
}
