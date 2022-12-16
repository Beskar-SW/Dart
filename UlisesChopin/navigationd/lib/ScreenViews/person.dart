import 'package:flutter/material.dart'; 

class Person extends StatelessWidget {
  const Person({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Column(
        children: [
          const Image(
          image: NetworkImage('https://static.wikia.nocookie.net/godofwar/images/d/dc/Kratos.jpg/revision/latest?cb=20160326181156&path-prefix=es'),
          width: 300,
          height: 300,
          ),
        const Text('Ulises Shie Sotelo Chopin'),
        const Text('19091435')
        ],
        
      ),
    );
  }
}