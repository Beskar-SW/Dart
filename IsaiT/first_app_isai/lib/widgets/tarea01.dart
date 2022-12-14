import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //use this controller to get data from the TextField
  final _input1 = TextEditingController();
  final _input2 = TextEditingController();

  //store text input into a variable
  var getText = '';

  @override
  Widget build(BuildContext context) {
    double resultado;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFfffdf7),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text("Calculadora"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _input1,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 22.0,
              ),
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _input2,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 22.0,
              ),
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                //Suma +
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      resultado = double.parse(_input1.text) +
                        double.parse(_input2.text);
                      getText = resultado.toString();
                      FocusScope.of(context).unfocus();
                    });
                  },
                  color: Colors.blueAccent,
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      )),
                ),
                // Resta -
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      resultado = double.parse(_input1.text) -
                        double.parse(_input2.text);
                      getText = resultado.toString();
                      FocusScope.of(context).unfocus();
                    });
                  },
                  color: Colors.blueAccent,
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('-',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      )),
                ),
                // Multiplicación *
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      resultado = double.parse(_input1.text) *
                        double.parse(_input2.text);
                      getText = resultado.toString();
                      FocusScope.of(context).unfocus();
                    });
                  },
                  color: Colors.blueAccent,
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('*',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      )),
                ),
                //División /
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      resultado = double.parse(_input1.text) /
                        double.parse(_input2.text);
                      getText = resultado.toString();
                      FocusScope.of(context).unfocus();
                    });
                  },
                  color: Colors.blueAccent,
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('/',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'Resultado: ${getText}',
              style: TextStyle(fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
