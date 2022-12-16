import 'package:flutter/material.dart';
import 'dart:math';

class FormCard extends StatefulWidget
{
  const FormCard({Key? key}) : super(key: key);
  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  double _resultado = 0;
  double _resultado1 = 0;
  double _a = 0;
  double _b = 0;
  double _c = 0;

  void num1(String value) =>
    setState(() =>
      _a = double.parse(value)
    );

  void num2(String value) =>
    setState(() =>
      _b = double.parse(value)
   );
  
  void num3(String value) =>
    setState(() =>
      _c = double.parse(value)
   );

  void suma(double a, double b, double c) {
    setState(() {
      _resultado = -b - sqrt(b*b - 4*a*c) / (2*a);
      _resultado1 = -b + sqrt(b*b - 4*a*c) / (2*a);
    });
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Column(
        children: [
          _numero1(),
          _numero2(),
          _numero3(),
          _buttonS(),
          const Text('El resultado de X1 es:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue
          ),),
          _resultadoT(),
          const Text('El resultado de X2 es:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue
          )
          ),
          _resultadoT1()
        ],
      )
    );
  }
  Widget _numero1(){
    return Container (
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.blue),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 50, left: 80, right: 80, bottom: 20),
      child: TextFormField(
        onChanged: num1,
        autofocus: true,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Ingrese el valor de a'
        )
      )
    );
  }
  Widget _numero2(){
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
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Ingrese el valor de b',
        )
      )
    );
  }
  Widget _numero3(){
    return Container (
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.blue),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 80,vertical: 20),
      child: TextFormField(
        onChanged: num3,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Ingrese el valor de c',
        )
      )
    );
  }
  Widget _buttonS(){
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(onPressed: () => suma(_a, _b,_c), child: const 
      Text('Operar')),
    );
  }
  
  Widget _resultadoT(){
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
  Widget _resultadoT1(){
    return Container (
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.blue),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 80 , vertical: 40),
      child: Text(
        '$_resultado1',
        style: const TextStyle(fontSize: 16),
      )
    );
  }
}