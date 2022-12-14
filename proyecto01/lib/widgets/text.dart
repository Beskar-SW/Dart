import 'package:flutter/material.dart';

void main() => runApp(const Widget1());

class Widget1 extends StatelessWidget {
  const Widget1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget1',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget1'),
        ),
        body: const Center(
          child: Text('Widget1'),
        ),
      ),
    );
  }
}

class widgetPage extends StatelessWidget {
  const widgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget1',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget1'),
        ),
        body: const Center(
          child: Text('Widget1'),
        ),
      ),
    );
  }
}

