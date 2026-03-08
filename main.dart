import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(PokeApp());
}

class PokeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Poképedia",
      home: LoginScreen(),
    );
  }
}
