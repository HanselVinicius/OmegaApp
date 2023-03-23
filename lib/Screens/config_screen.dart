import 'package:flutter/material.dart';
import 'package:omega_app/Services/WebClient.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _text;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      WebClient.url = _text;
      Navigator.popAndPushNamed(context, 'home');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Config'),
     leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: () {
       Navigator.popAndPushNamed(context, 'home');
     },), ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'IP'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor coloque algum IP';
                  }
                  return null;
                },
                onSaved: (value) {
                  _text = value!;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}