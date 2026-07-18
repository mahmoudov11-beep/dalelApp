import 'package:flutter/material.dart';

class haveAnAccount extends StatelessWidget {
  const haveAnAccount({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  final String text1, text2;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: AlignmentGeometry.center,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: text1),
              TextSpan(text: text2),
            ],
          ),
        ),
      ),
    );
  }
}
