import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class home_view extends StatelessWidget {
  const home_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryColor,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              customReplacementNavigation(context, '/signin');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text('Home')),
    );
  }
}
