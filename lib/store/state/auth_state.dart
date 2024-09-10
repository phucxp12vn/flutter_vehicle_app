class LoginFormState {
  final String username;
  final String password;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;

  LoginFormState({
    this.username = '',
    this.password = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.isFailure = false,
  });

  factory LoginFormState.initial() => LoginFormState();

  LoginFormState copyWith({
    String? username,
    String? password,
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return LoginFormState(
      username: username ?? this.username,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}
