
import 'package:flutter/material.dart';

import '../widgets/onBoarding_widget.dart';

class onBoarding_body extends StatelessWidget {
 const onBoarding_body({super.key, required this.controller, this.onPagechanger});
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
