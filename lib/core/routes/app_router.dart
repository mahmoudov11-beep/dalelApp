import 'package:dalel_app/features/auth/presentation/views/signIn_view.dart';
import 'package:dalel_app/features/home/presentation/views/onBoarding_view.dart.dart';
import 'package:dalel_app/features/auth/presentation/views/signUp_view.dart';
import 'package:dalel_app/features/splash/presentation/views/spashView.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const splashView()),
    GoRoute(path: '/homeview', builder: (context, state) => onBoarding()),
    GoRoute(path: '/signup', builder: (context, state) => const signupView()),
    GoRoute(path: '/signin', builder: (context, state) => const SigninView()),
  ],
);
