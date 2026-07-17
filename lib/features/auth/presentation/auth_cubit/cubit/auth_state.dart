sealed class SignUpState {}

final class initialState extends SignUpState {}

final class loadingState extends SignUpState {}

final class errorState extends SignUpState {
  final String errMessage;

  errorState({required this.errMessage});
}

final class SuccessfulState extends SignUpState {}

final class termsAndConditionState extends SignUpState {}

final class ObsecureValueState extends SignUpState {}

final class LoginStatus_state extends SignUpState {}
