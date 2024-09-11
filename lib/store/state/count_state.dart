import '../actions/count.dart';

class CountState {
  final Map<CountCategory, int> counts;

  CountState({
    Map<CountCategory, int>? counts,
  }) : counts =
            counts ?? {for (var category in CountCategory.values) category: 0};

  factory CountState.initial() => CountState();

  CountState copyWith({
    Map<CountCategory, int>? counts,
  }) {
    return CountState(
      counts: counts ?? this.counts,
    );
  }

  int getCount(CountCategory category) => counts[category] ?? 0;
}
