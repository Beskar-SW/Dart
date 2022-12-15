import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Tarea(),
    );
  }
}

class Tarea extends StatefulWidget {
  const Tarea({super.key});

  @override
  State<Tarea> createState() => _TareaState();
}

class _TareaState extends State<Tarea> {
  double _resultado = 0;
  String a = "", b = "";

  void sumar(double a, double b) => setState(() => _resultado = a + b);

  void restar(double a, double b) => setState(() => _resultado = a - b);

  void multiplicar(double a, double b) => setState(() => _resultado = a * b);

  void dividir(double a, double b) => setState(() => _resultado = a / b);

  void inputA(String value) => setState(() => a = value);

  void inputB(String value) => setState(() => b = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarea 01'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                '$_resultado',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            TextField(
              onChanged: inputA,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese un número',
              ),
            ),
            TextField(
              onChanged: inputB,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese un número',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => sumar(double.parse(a), double.parse(b)),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => restar(double.parse(a), double.parse(b)),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      multiplicar(double.parse(a), double.parse(b)),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => dividir(double.parse(a), double.parse(b)),
                  child: const Text('/'),
                ),
                ElevatedButton(
                    onPressed: () => setState(() {
                          _resultado = 0;
                        }),
                    child: const Text('C')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
