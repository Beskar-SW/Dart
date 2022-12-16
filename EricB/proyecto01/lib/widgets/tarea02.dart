import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectItem = 0;
  _getItemWidget(int pos){
    switch(pos){
      case 1: return Factorial();
      case 2: return AboutMe();
      case 3: return Pokemon();
    }


  }

  _onSelectItem(int pos){
    setState(() {
      _selectItem = pos;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        ),
        body: _getItemWidget(_selectItem),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('eric'),
                  ],),

                accountEmail: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('ericcastillo005@gmail.com'),
                  ],),

                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.red,
                  child:(Text('E', style: TextStyle(fontSize: 40.0))),
                ),
                
                
                /*accountName: Text('Eric'),
                accountEmail: Text('ericcastillo005@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.red,
                  child:(Text('E', style: TextStyle(fontSize: 40.0))),
                ),*/
              ),
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                onTap: (){
                  _onSelectItem(0);
                }
              ),
              ListTile(
                title: Text('Factorial'),
                leading: Icon(Icons.functions),
                onTap: (){
                  _onSelectItem(1);
                  
                }
              ),
              ListTile(
                title: Text('Pokemon'),
                leading: Icon(Icons.radio_button_checked),
                onTap: () {
                  _onSelectItem(3);
                },
              ),
              ListTile(
                title: Text('About me'),
                leading: Icon(Icons.info),
                onTap:(){
                  _onSelectItem(2);
                }
              ),
            ],
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Factorial extends StatefulWidget{
  //const Factorial({super.key : super(key: key)});
  const Factorial({Key? key}) : super(key: key);
  @override 
  _Factorial createState() => _Factorial();
}

class _Factorial extends State<Factorial>{
  final _numero = TextEditingController();
  var result = '';
  int calculos(int n){
    if(n == 0){
      n = 1;
    } else {
      n = n * calculos(n-1);
    }
    return n;
  }
  void _calcularFact(){
    setState(() {
      int fact = calculos(int.parse(_numero.text)); 
      result = fact.toString();   
    //print(result);
    });
  }
  @override 
  
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Result: $result',
                //'$_counter',
              ),
              TextFormField(
                controller: _numero,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Ingrese un numero",
                  border: OutlineInputBorder(),
                ),
              validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese un numero";
                  }
                  return null;
                },
              ),
              ElevatedButton	(
              onPressed:(){
                  _calcularFact();
                },
                child: Text('Calcular'),
              ),
            ],
          ),
        ), 
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _calcularFact,
        tooltip: 'Calculate',
        child: const Icon(Icons.add),
        ),*/
    );
  }
}

class AboutMe extends StatefulWidget{
  //const AboutMe({Key? key}) : super(key: key);
  const AboutMe({Key? key}) : super(key: key);
  @override 
  _AboutMe createState() => _AboutMe();
}

class _AboutMe extends State<AboutMe>{

  @override 
  Widget build(BuildContext context){
    return Center(
      child: Text('about'),
    );
  }
}

class Pokemon extends StatefulWidget{
  const Pokemon({Key? key}) : super(key: key);
  @override 
  _Pokemon createState() => _Pokemon();
}

class _Pokemon extends State<Pokemon>{
  //var url = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  
  fetchMovies() async {
    var url;
    url = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/now_playing?api_key=1500496dcaf1512b62894bd98ba83f9d&language=en-US"));
    return json.decode(url.body)['results'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
          future: fetchMovies(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Container(
                        height: 250,
                        alignment: Alignment.centerLeft,
                        child: Card(
                          child: Image.network(
                              "https://image.tmdb.org/t/p/w500" +
                                  snapshot.data[index]['poster_path']),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                snapshot.data[index]["original_title"],
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data[index]["release_date"],
                                style: TextStyle(color: Color(0xff868597)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100,
                                child: Text(
                                  snapshot.data[index]["overview"],
                                  style: TextStyle(color: Color(0xff868597)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  
}
