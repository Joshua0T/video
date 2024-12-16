import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video/plataforma.dart'; // Importa la clase VideoPlatform
import 'package:video/home.dart'; // Importa la pantalla inicial

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => VideoPlatform(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plataforma de Videos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
