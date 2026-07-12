import 'package:dalel_app/features/home/presentation/views/homeView.dart';
import 'package:dalel_app/features/splash/presentation/views/spashView.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const splashView()),
    GoRoute(path: '/homeview', builder: (context, state) => const HomeView()),
  ],
);
