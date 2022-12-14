import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Adding two numbers';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Puts out the debug badge
      title: _title,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: _title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});  

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _input1 = TextEditingController();
  final _input2 = TextEditingController();
  //final _sum = TextEditingController();
  //int _counter=0;

  var result = '';
  
  void _addingNumbers() {
    setState(() {
      double sum = double.parse(_input1.text) + double.parse(_input2.text);
      result = sum.toString();
      //print(sum);
    });
  }

  @override
  Widget build(BuildContext context) {
    //double sum = 0;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Insert two numbers',
            ),
            TextField(
              controller: _input1,
              decoration: const InputDecoration(
                //hintText: 'Insert a number',
                labelText: 'Insert a number',
                //onPressed: hintText = '',
              ),
              keyboardType: TextInputType.number,
              /*validator: (int? value){
                if(_input1 == null || _input1.isEmpty){
                  return 'Please enter a number';
                }
                return null;
              }, */
            ),
            TextField(
              controller: _input2,
              decoration: const InputDecoration(
                labelText: 'Insert a number',
              ),
              keyboardType: TextInputType.number,
            ),
            Text(
              'Result:\n$result',
              //'$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
     
      
      floatingActionButton: FloatingActionButton(
        onPressed: _addingNumbers,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
