import 'package:flutter/material.dart';
import 'package:atividade4/home_page.dart';

class ListPage extends StatefulWidget {
  final List<Map<String, String>> formData;
  final Function(int, Map<String, String>) onEdit;

  const ListPage({super.key, required this.formData, required this.onEdit});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  void _deleteItem(int index) {
    setState(() {
      widget.formData.removeAt(index);
    });
  }

  void _editItem(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          initialData: widget.formData[index],
          editIndex: index,
          onEdit: widget.onEdit,
        ),
      ),
    ).then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Dados'),
      ),
      body: ListView.builder(
        itemCount: widget.formData.length,
        itemBuilder: (context, index) {
          final item = widget.formData[index];
          return Card(
            child: ListTile(
              title: Text(item['name']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: ${item['email']}'),
                  Text('Data de Nascimento: ${item['dob']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _editItem(index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteItem(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
