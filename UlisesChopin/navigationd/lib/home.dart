import 'package:flutter/material.dart';
import 'ScreenViews/math.dart';
import 'ScreenViews/person.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectDrawerIcon = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const Center(
        child: Text('Bienvenido a mi aplicación'));
      case 1:
        return const Math();
      case 2:
        return const Person();
    }
  }
  _onSelectItem(int pos) {
    setState(() {
      _selectDrawerIcon = pos;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigatino Drawer'),
      ),
      drawer: Drawer(

        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Ulises Chopin'),
              accountEmail: Text('uliseschopin16@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  'U',
                  style: TextStyle(fontSize: 40.0)
                ),
              ),
            ),
            ListTile(
              title: const Text('Algebra'),
              leading: const Icon(Icons.school),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              title: const Text('Datos Personales'),
              leading: const Icon(Icons.person),
              onTap: () {
                _onSelectItem(2);
              },
            ),
          ],
        )

      ),
      body: _getDrawerItemWidget(_selectDrawerIcon),
    );
  }
}