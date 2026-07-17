import 'package:dalel_app/app/dalel_app.dart';
import 'package:dalel_app/core/Serivces/service_locator.dart';
import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/userStateChanges.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await getIt<CacheHelper>().init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  userStateChanges();
  runApp(const MyApp());
}
