import 'dart:async';
import 'dart:html';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData.dark(),
      home: const Login(),
    );
  }
}

class SecondRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Bienvenido',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData.dark(),
      home: const Welcome(),

    );
  }
}

class Welcome extends StatefulWidget{
  const Welcome({Key? key}) : super(key: key);
  @override 
  _WelcomeState createState() => _WelcomeState();
}
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _correo = TextEditingController();
  final _contrasena = TextEditingController();
  var _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https://static.vecteezy.com/system/resources/previews/006/874/233/large_2x/netflix-logo-icon-on-white-background-free-vector.jpg'),
              // <a href="https://www.vecteezy.com/vector-art/6874233-netflix-logo-icon-vector-on-white-background">Netflix logo icon vector on white background Vectors by Vecteezy</a>
              TextFormField(
                controller: _correo,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Correo",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains("@")) {
                    return "Por favor ingrese un correo válido";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _contrasena,
                decoration: const InputDecoration(
                  hintText: "Contraseña",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese una contraseña";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _visible = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()),
                    );
                  });

                  Future.delayed(const Duration(seconds: 3));

                  var url = Uri.parse("http://192.168.0.13:3000/login");
                  var body = {
                    "correo": _correo.text,
                    "contrasena": _contrasena.text,
                  };
                  var response;
                  try {
                    response = await http.post(url, body: body);
                  } catch (e) {
                    print(e);
                  }

                  if (response.statusCode == 200) {
                    //Alerta de login exitoso

                    AlertDialog alert = AlertDialog(
                      title: const Text("Login exitoso"),
                      content: const Text("Bienvenido"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              _visible = false;
                            });
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    );

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  } else {
                    //Alerta de login fallido

                    AlertDialog alert = AlertDialog(
                      title: const Text("Login fallido"),
                      content: const Text("Usuario o contraseña incorrectos"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              _visible = false;
                            });
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    );

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }
                },
                child: const Text(
                  "Iniciar Sesión",
                  key: Key("button"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _visible,
                child: const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeState extends State<Welcome>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Center(
        // child: Text('Welcome '),
        child: ElevatedButton	(
          onPressed:(){
            Navigator.pop(context);
          },
          child: Text('Regresar'),
        ),
      )   
    );
  }
}

