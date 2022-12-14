import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(const Widget1());

class Widget1 extends StatelessWidget{
  const Widget1({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget de Texto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const Widget1Page(),
    );
  }
}

//class Widget1Page extends StatelessWidget{
  //onst Widget1Page/({Key? key}): super(key: key);
  /*
  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(
      title: const Text('Widget de Texto'),
      ),
      body: const Center(
        child:Text(
          'Texto Nuevo',
          style: TextStyle(
            color: Colors.blue
          )
        )
        )
      
    );
  }
}*/