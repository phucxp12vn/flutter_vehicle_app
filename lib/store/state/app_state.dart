import 'package:flutter_complete_guide/store/state/auth_state.dart';
import 'package:flutter_complete_guide/store/state/count_state.dart';
import 'package:flutter_complete_guide/store/state/library_state.dart';

class AppState {
  final LoginFormState authState;
  final CountState countState;
  final LibraryState libraryState;

  AppState({
    required this.authState,
    required this.countState,
    required this.libraryState,
  });

  factory AppState.initial() {
    return AppState(
      authState: LoginFormState.initial(),
      countState: CountState.initial(),
      libraryState: LibraryState.initial(),
    );
  }
}
