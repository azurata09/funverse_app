import 'package:flutter/material.dart';
import 'profile.dart';


void main() {
  runApp(const preApp());
}


class preApp extends StatelessWidget {
  const preApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'マイプロフィール',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProfilePage(title: 'マイプロフィール'),
    );
  }
}



