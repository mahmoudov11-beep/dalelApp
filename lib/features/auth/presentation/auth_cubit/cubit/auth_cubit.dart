import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class authCubit extends Cubit<SigningState> {
  authCubit() : super(initialState());
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  bool? termsAndConditionValue = false;
  bool obSecureValue = true;
  bool isLogin = true;
  GlobalKey<FormState> Signupkey = GlobalKey();
  GlobalKey<FormState> Signinkey = GlobalKey();
  GlobalKey<FormState> ResetPasswordkey = GlobalKey();

  Future<void> signUpwithemailAndPassword() async {
    try {
      emit(loadingSignupState());
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      try {
        await addUserProfile();
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        print('Verification email sent successfully');
      } catch (e) {
        print('Error sending verification: $e');
      }
      emit(SuccessfulSignupState());
    } on FirebaseAuthException catch (e) {
      _auth_handleException(e);
    } catch (e) {
      emit(errorSignupState(errMessage: e.toString()));
    }
  }

  void _auth_handleException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(errorSignupState(errMessage: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(
        errorSignupState(
          errMessage: 'The account already exists for that email.',
        ),
      );
    } else {
      emit(errorSignupState(errMessage: 'incorrect Credentials!'));
    }
  }

  Future<void> verifyAccount() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> resetPassword() async {
    try {
      emit(loadingPassResetState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      emit(SuccessfulPassResetState());
    } on Exception catch (e) {
      emit(errorPassResetState(errMessage: e.toString()));
    }
  }

  Future<void> signinWithEmailAndPassword() async {
    try {
      emit(loadingSigninState());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      emit(SuccessfulSigninState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(errorSigninState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
          errorSigninState(
            errMessage: 'Wrong password provided for that user.',
          ),
        );
      } else {
        emit(errorSigninState(errMessage: 'Email or Password incorrect'));
      }
    } catch (e) {
      emit(errorSigninState(errMessage: e.toString()));
    }
  }

  Future<void> addUserProfile() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users.add({
      'first_name': firstName, // John Doe
      'last_name': lastName, // Stokes and Sons
      'email': email, // 42
    });
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
