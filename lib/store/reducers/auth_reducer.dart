import '../state/auth_state.dart';
import '../actions/auth.dart';

LoginFormState loginFormReducer(LoginFormState state, dynamic action) {
  if (action is UpdateUsernameAction) {
    return state.copyWith(username: action.username);
  } else if (action is UpdatePasswordAction) {
    return state.copyWith(password: action.password);
  } else if (action is LoginLoadingAction) {
    return state.copyWith(isLoading: true, isSuccess: false, isFailure: false);
  } else if (action is LoginSuccessAction) {
    return state.copyWith(isLoading: false, isSuccess: true, isFailure: false);
  } else if (action is LoginFailureAction) {
    return state.copyWith(isLoading: false, isSuccess: false, isFailure: true);
  } else {
    return state;
  }
}
