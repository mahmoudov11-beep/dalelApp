sealed class SigningState {}

final class initialState extends SigningState {}

final class loadingSignupState extends SigningState {}

final class errorSignupState extends SigningState {
  final String errMessage;

  errorSignupState({required this.errMessage});
}

final class SuccessfulSignupState extends SigningState {}

//.....................
final class loadingSigninState extends SigningState {}

final class errorSigninState extends SigningState {
  final String errMessage;

  errorSigninState({required this.errMessage});
}

final class SuccessfulSigninState extends SigningState {}

final class loadingPassResetState extends SigningState {}

final class errorPassResetState extends SigningState {
  final String errMessage;

  errorPassResetState({required this.errMessage});
}

final class SuccessfulPassResetState extends SigningState {}

//.............................
final class termsAndConditionState extends SigningState {}

final class ObsecureValueState extends SigningState {}

final class LoginStatus_state extends SigningState {}
