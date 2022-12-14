import 'package:flutter/material.dart';

void main() => runApp(const Tarea1());

class Tarea1 extends StatelessWidget {
  const Tarea1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarea1',
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
  double _valor1 = 0;
  double _valor2 = 0;
  
  void sumar(double valor1, double valor2) {
    setState(() {
      _resultado = _valor1 + _valor2;
    });
  }
  void restar(double valor1, double valor2) {
    setState(() {
      _resultado = _valor1 - _valor2;
    });
  }
  void multiplicar(double valor1, double valor2) {
    setState(() {
      _resultado = _valor1 * _valor2;
    });
  }
  void dividir(double valor1, double valor2) {
    setState(() {
      _resultado = _valor1 / _valor2;
    });
  }
  void input1(String valor) {
    setState(() {
      _valor1 = double.parse(valor);
    });
  }
  void input2(String valor) {
    setState(() {
      _valor2 = double.parse(valor);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarea 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_resultado',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
              onChanged: (String valor) {
                input1(valor);
              },
              decoration: const InputDecoration(
                hintText: 'Ingrese el primer valor',
              ),
            ),
            TextField(
              onChanged: (String valor) {
                input2(valor);
              },
              decoration: const InputDecoration(
                hintText: 'Ingrese el segundo valor',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    sumar(_valor1, _valor2);
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    restar(_valor1, _valor2);
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    multiplicar(_valor1, _valor2);
                  },
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    dividir(_valor1, _valor2);
                  },
                  child: const Text('/'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
