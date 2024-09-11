import '../state/count_state.dart';
import '../actions/count.dart';

CountState countReducer(CountState state, dynamic action) {
  if (action is IncrementCountAction) {
    final updatedCounts = Map<CountCategory, int>.from(state.counts);
    updatedCounts[action.category] = (updatedCounts[action.category] ?? 0) + 1;
    return state.copyWith(counts: updatedCounts);
  }

  return state;
}
