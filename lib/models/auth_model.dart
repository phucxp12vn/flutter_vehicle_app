import 'package:redux/redux.dart';
import '../store/actions/auth.dart';
import '../store/state/app_state.dart';
import '../db/database_v2.dart';

class LoginViewModel {
  final Function(String) onUsernameChanged;
  final Function(String) onPasswordChanged;
  final Function onLogin;
  final Function onLogout;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;

  LoginViewModel({
    required this.onUsernameChanged,
    required this.onPasswordChanged,
    required this.onLogin,
    required this.onLogout,
    required this.isLoading,
    required this.isSuccess,
    required this.isFailure,
  });

  static LoginViewModel fromStore(Store<AppState> store) {
    return LoginViewModel(
      onUsernameChanged: (username) =>
          store.dispatch(UpdateUsernameAction(username)),
      onPasswordChanged: (password) =>
          store.dispatch(UpdatePasswordAction(password)),
      onLogin: () async {
        store.dispatch(LoginLoadingAction());
        try {
          // Simulate login API call
          bool success = await login(
              store.state.authState.username, store.state.authState.password);

          if (success) {
            // Save login state to IndexedDB
            final database = AppDatabase.instance;
            await database.insertLoginState(LoginStates(isLoggedIn: true));

            store.dispatch(LoginSuccessAction());
          } else {
            store.dispatch(LoginFailureAction());
          }
        } catch (error) {
          store.dispatch(LoginFailureAction());
        }
      },
      onLogout: () async {
        // Clear the auth state in the Redux store
        store.dispatch(LogoutAction());

        // Clear login state in the database
        final database = AppDatabase.instance;
        await database.clearLoginState();
      },
      isLoading: store.state.authState.isLoading,
      isSuccess: store.state.authState.isSuccess,
      isFailure: store.state.authState.isFailure,
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
