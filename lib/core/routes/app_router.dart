import 'package:dalel_app/features/splash/presentation/views/spashView.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => splashView(),
    ),
  ],
);
