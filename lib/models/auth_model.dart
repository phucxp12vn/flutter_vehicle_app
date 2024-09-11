import 'package:drift/drift.dart';
import 'package:redux/redux.dart';
import '../store/state/auth_state.dart';
import '../store/actions/auth.dart';
import '../db/database.dart';

class LoginViewModel {
  final Function(String) onUsernameChanged;
  final Function(String) onPasswordChanged;
  final Function onLogin;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;

  LoginViewModel({
    required this.onUsernameChanged,
    required this.onPasswordChanged,
    required this.onLogin,
    required this.isLoading,
    required this.isSuccess,
    required this.isFailure,
  });

  static LoginViewModel fromStore(Store<LoginFormState> store) {
    return LoginViewModel(
      onUsernameChanged: (username) =>
          store.dispatch(UpdateUsernameAction(username)),
      onPasswordChanged: (password) =>
          store.dispatch(UpdatePasswordAction(password)),
      onLogin: () async {
        store.dispatch(LoginLoadingAction());
        try {
          // Simulate login API call
          bool success =
              await login(store.state.username, store.state.password);

          if (success) {
            // Save login state to SQLite
            final database = AppDatabase.instance;
            await database.insertLoginState(
                const LoginStatesCompanion(isLoggedIn: Value(true)));

            store.dispatch(LoginSuccessAction());
          } else {
            store.dispatch(LoginFailureAction());
          }
        } catch (error) {
          store.dispatch(LoginFailureAction());
        }
      },
      isLoading: store.state.isLoading,
      isSuccess: store.state.isSuccess,
      isFailure: store.state.isFailure,
    );
  }
}

// Simulate login API call
Future<bool> login(String username, String password) async {
  await Future.delayed(const Duration(seconds: 1)); // Mock delay
  if (username != '' && password != '') {
    return true;
  } else {
    throw Exception('Login failed');
  }
}
