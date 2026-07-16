import 'package:go_router/go_router.dart';

void customNavigation(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void delayedNavigator(context , path) {
  Future.delayed(Duration(seconds: 2), () {
    customNavigation(context, path);
  });
}
