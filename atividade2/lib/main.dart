import 'package:flutter/material.dart';

//- Crie uma aplicação em Dart que utilize os conceitos de Generics.
//- Escreva testes unitários para comprovar que o software funciona.
//- O tema (regra de negócio) será uma aplicação bancária.

//E, T, S, K, and V.

void main() {
  runApp(const MyApp());
}

String tipoLista<T>(List<T> lista){
  String tipo;
  if(lista is List<int>) {
    tipo = 'lista de inteiros: ';
    } else if(lista is List<String>) {
      tipo = 'lista de Strings: ';
      } else {
      tipo = 'lista de outro tipo (não é nem int nem String): ';
      }
  return (tipo + lista.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        return MaterialApp(
      title: 'Atividade 2',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Atividade 2'),
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text(tipoLista([])),
              )
            )
          ]
        )
      ),
    );
  }
}
