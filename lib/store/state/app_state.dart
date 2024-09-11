import 'package:flutter_complete_guide/store/state/auth_state.dart';
import 'package:flutter_complete_guide/store/state/count_state.dart';

class AppState {
  final LoginFormState authState;
  final CountState countState;

  AppState({required this.authState, required this.countState});

  factory AppState.initial() {
    return AppState(
      authState: LoginFormState.initial(),
      countState: CountState.initial(),
    );
  }
}
