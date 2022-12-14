import 'package:flutter/material.dart';

class FormCard extends StatefulWidget
{
  const FormCard({Key? key}) : super(key: key);
  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  double _resultado = 0;
  double _a = 0;
  double _b = 0;

  void num1(String value) =>
    setState(() =>
      _a = double.parse(value)
    );

  void num2(String value) =>
    setState(() =>
      _b = double.parse(value)
   );

  void suma(double a, double b) =>
    setState(() =>
      _resultado = a + b
    );
  void resta(double a, double b) =>
    setState(() =>
      _resultado = a - b
    );
  void multiplicacion(double a, double b) =>
    setState(() =>
      _resultado = a * b
    );
  void division(double a, double b) =>
    setState(() =>
      _resultado = a / b
    );
  
  
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Column(
        children: [
          _numero1(),
          _numero2(),
          _buttonS(),
          _buttonR(),
          _buttonM(),
          _buttonD(),
          _resultadoT()
        ],
      )
    );
  }
  Container _numero1(){
    return Container (
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.blue),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 80 , vertical: 40),
      child: TextFormField(
        onChanged: num1,
        autofocus: true,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Ingrese un numero'
        )
      )
    );
  }
  Container _numero2(){
    return Container (
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.blue),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 80),
      child: TextFormField(
        onChanged: num2,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Ingrese un numero',
        )
      )
    );
  }
  Container _buttonS(){
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(onPressed: () => suma(_a, _b), child: const 
      Text('Suma')),
    );
  }
  Container _buttonR(){
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(onPressed: () => resta(_a, _b), child: const 
      Text('Resta')),
    );
  }
  Container _buttonM(){
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(onPressed: () => multiplicacion(_a, _b), child: const 
      Text('Multiplicación')),
    );
  }
  Container _buttonD(){
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(onPressed: () => division(_a, _b), child: const 
      Text('División')),
    );
  }
  Container _resultadoT(){
    return Container (
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.blue),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 80 , vertical: 40),
      child: Text(
        '$_resultado',
        style: const TextStyle(fontSize: 16),
      )
    );
  }
}