import 'package:dalel_app/core/functions/navigation.dart';
import 'package:flutter/material.dart';

class forgetPasswordWidget extends StatelessWidget {
  const forgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customReplacementNavigation(context, '/forgotPass');
      },
      child: Align(
        alignment: AlignmentGeometry.centerRight,
        child: Text('Forget Password ?'),
      ),
    );
  }
}
