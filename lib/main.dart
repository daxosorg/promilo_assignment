import 'package:flutter/material.dart';
import 'package:promilo_assignment/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(primarySwatch: Colors.blue, unselectedWidgetColor: Colors.green),
      home: const LoginScreen(),
      // home: const SecondScreen(),
    );
  }
}
