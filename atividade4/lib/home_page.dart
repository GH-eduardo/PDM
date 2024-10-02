import 'package:flutter/material.dart';
import 'package:atividade4/list_page.dart';

class HomePage extends StatefulWidget {
  final Map<String, String>? initialData;
  final int? editIndex;
  final Function(int, Map<String, String>)? onEdit;

  const HomePage({super.key, this.initialData, this.editIndex, this.onEdit});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();

  final List<Map<String, String>> _formData = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      _nameController.text = widget.initialData!['name']!;
      _emailController.text = widget.initialData!['email']!;
      _dobController.text = widget.initialData!['dob']!;
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final newData = {
        'name': _nameController.text,
        'email': _emailController.text,
        'dob': _dobController.text,
      };

      if (widget.editIndex != null && widget.onEdit != null) {
        widget.onEdit!(widget.editIndex!, newData);
      } else {
        setState(() {
          _formData.add(newData);
        });
      }

      _nameController.clear();
      _emailController.clear();
      _dobController.clear();
    }
  }

  void _navigateToListPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListPage(
          formData: _formData,
          onEdit: (index, data) {
            setState(() {
              _formData[index] = data;
            });
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _navigateToListPage,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(labelText: 'Data de Nascimento'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua data de nascimento';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}