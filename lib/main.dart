// lib/main.dart
import 'package:examen_final_jaume/screens/login_screen.dart';
import 'package:flutter/material.dart';          
void main() {
  runApp(MyApp());
}
          
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulacre Practic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Ruta inicial
    );
  }
}
