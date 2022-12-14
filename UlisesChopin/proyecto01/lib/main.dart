import 'package:flutter/material.dart';
import 'package:proyecto01/widgets/Formulario.dart';

void  main() => runApp(const MyApp());

@override
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Operaciones Aritmeticas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Scaffold(
        appBar: AppBar(
          title: const Text('Operaciones Aritmeticas'),
        ),
        body: const FormCard(),
        ),
    );
  }
}
