import 'package:go_router/go_router.dart';

void customNavigation(context, String path) {
  GoRouter.of(context).push(path);
}

void delayedNavigator(context) {
  Future.delayed(Duration(seconds: 2), () {
    customNavigation(context, "/homeview");
  });
}
