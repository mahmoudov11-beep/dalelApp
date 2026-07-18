import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/views/forogtPassword_view.dart';
import 'package:dalel_app/features/auth/presentation/views/signIn_view.dart';
import 'package:dalel_app/features/home/presentation/views/home_view.dart';
import 'package:dalel_app/features/splash/presentation/views/onBoarding_view.dart.dart';
import 'package:dalel_app/features/auth/presentation/views/signUp_view.dart';
import 'package:dalel_app/features/splash/presentation/views/spashView.dart';
import 'package:dalel_app/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => signin_view()),
    GoRoute(path: '/home', builder: (context, state) => const home_view()),
    GoRoute(path: '/homeview', builder: (context, state) => onBoarding()),
    GoRoute(
      path: '/signup',
      builder: (context, state) =>
          BlocProvider(create: (context) => authCubit(), child: signupView()),
    ),
    GoRoute(path: '/signin', builder: (context, state) => const signin_view()),
    GoRoute(path: '/forgotPass', builder: (context, state) => const forgotPasswordView()),
  ],
);
