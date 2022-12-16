import 'package:flutter/material.dart'; 
import 'widgets/formulario.dart';

class Math extends StatelessWidget {
  const Math({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormCard(),
    );
  }
}