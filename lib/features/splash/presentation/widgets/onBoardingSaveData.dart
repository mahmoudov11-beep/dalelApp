import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/main.dart';

void onBoardingSaveData() {
  getIt<CacheHelper>().saveData(key: 'onBoardingVisited', value: true);
}
