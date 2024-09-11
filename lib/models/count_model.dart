import 'package:redux/redux.dart';
import '../store/actions/count.dart';
import '../store/state/app_state.dart';

class CountViewModel {
  final Function onIncrementCount;

  CountViewModel({
    required this.onIncrementCount,
  });

  static CountViewModel fromStore(Store<AppState> store) {
    return CountViewModel(
      onIncrementCount: (CountCategory category) =>
          store.dispatch(IncrementCountAction(category)),
    );
  }
}
