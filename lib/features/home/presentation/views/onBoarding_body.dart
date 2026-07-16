import 'package:dalel_app/features/home/presentation/widgets/onBoarding_widget.dart';
import 'package:flutter/material.dart';

class onBoarding_body extends StatelessWidget {
  onBoarding_body({super.key, required this.controller, this.onPagechanger});
  final PageController controller;
  final Function(int)? onPagechanger;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: onBoarding_widget(
        controller: controller,
        onPageChanged: onPagechanger,
      ),
    );
  }
}
