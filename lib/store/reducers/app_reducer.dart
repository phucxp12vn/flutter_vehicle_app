import 'package:flutter_complete_guide/store/state/app_state.dart';
import 'package:flutter_complete_guide/store/reducers/auth_reducer.dart';
import 'package:flutter_complete_guide/store/reducers/count_reducer.dart';
import 'package:flutter_complete_guide/store/reducers/library_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    authState: loginFormReducer(state.authState, action),
    countState: countReducer(state.countState, action),
    libraryState: libraryReducer(state.libraryState, action),
  );
}
