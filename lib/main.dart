import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(child: Image.asset(Assets.assetsImagesOnBoarding1)),
      ),
    );
  }
}
