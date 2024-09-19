class UpdateUsernameAction {
  final String username;
  UpdateUsernameAction(this.username);
}

class UpdatePasswordAction {
  final String password;
  UpdatePasswordAction(this.password);
}

class LoginLoadingAction {}

class LoginSuccessAction {}

class LoginFailureAction {}

class LogoutAction {}
