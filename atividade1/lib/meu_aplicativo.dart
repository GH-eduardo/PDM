import 'package:flutter/material.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade 1',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Atividade 1'),
        ),
        body: ListView(
          children: const <Widget>[
            Card(
              child: ListTile(
                title: Text('Item 1'),
                subtitle: Text('Descrição do item 1'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 2'),
                subtitle: Text('Descrição do item 2'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 3'),
                subtitle: Text('Descrição do item 3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}