import 'package:go_router/go_router.dart';

void customReplacementNavigation(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void customGoNavigation(context, String path) {
  GoRouter.of(context).go(path);
}

void delayedNavigator(context, path) {
  Future.delayed(Duration(seconds: 2), () {
    customReplacementNavigation(context, path);
  });
}
