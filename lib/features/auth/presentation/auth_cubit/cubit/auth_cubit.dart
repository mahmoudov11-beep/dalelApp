import 'package:bloc/bloc.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class authCubit extends Cubit<SignUpState> {
  authCubit() : super(initialState());
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  bool? termsAndConditionValue = false;
  bool obSecureValue = true;
  bool isLogin = true;
  GlobalKey<FormState> key = GlobalKey();
  signUpwithemailAndPassword() async {
    try {
      emit(loadingState());
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      emit(SuccessfulState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(errorState(errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(
          errorState(errMessage: 'The account already exists for that email.'),
        );
      }
    } catch (e) {
      emit(errorState(errMessage: e.toString()));
    }
  }

  checkBoxWidgetCubit({required newValue}) {
    termsAndConditionValue = newValue;
    emit(termsAndConditionState());
  }

  obSecureText({required newvalue}) {
    obSecureValue = newvalue;
    emit(ObsecureValueState());
  }

  loginStatus({required value}) {
    isLogin = value;
    emit(LoginStatus_state());
  }
}
