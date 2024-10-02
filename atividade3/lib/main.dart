import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OperationForm(),
    );
  }
}

class OperationForm extends StatefulWidget {
  const OperationForm({super.key});

  @override
  _OperationFormState createState() => _OperationFormState();
}

class _OperationFormState extends State<OperationForm> {
  String? _operation;
  final TextEditingController _amountController = TextEditingController();
  final List<String> _operations = [];

  void _addOperation() {
    if (_operation != null && _amountController.text.isNotEmpty) {
      final now = DateTime.now();
      final formattedTime = "${now.hour}:${now.minute}:${now.second}";
      setState(() {
        _operations.add("$_operation de ${_amountController.text} às $formattedTime");
      });
      _amountController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividade 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RadioListTile<String>(
              title: const Text('Depósito'),
              value: 'Depósito',
              groupValue: _operation,
              onChanged: (value) {
                setState(() {
                  _operation = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Saque'),
              value: 'Saque',
              groupValue: _operation,
              onChanged: (value) {
                setState(() {
                  _operation = value;
                });
              },
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _addOperation,
              child: const Text('Confirmar'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _operations.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_operations[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}