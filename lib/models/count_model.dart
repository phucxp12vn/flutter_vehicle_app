import 'package:redux/redux.dart';
import '../store/actions/count.dart';
import '../store/state/app_state.dart';
import '../db/database.dart';

class CountViewModel {
  final Function onIncrementCount;

  CountViewModel({
    required this.onIncrementCount,
  });

  static CountViewModel fromStore(Store<AppState> store) {
    return CountViewModel(
      onIncrementCount: (CountCategory category) async {
        store.dispatch(IncrementCountAction(category));

        // Save data to database
        final database = AppDatabase.instance;
        await database.incrementItemClick(category.toString().split('.')[1]);
      },
    );
  }
}
