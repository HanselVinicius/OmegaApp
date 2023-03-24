import 'package:flutter/material.dart';
import 'package:omega_app/Services/WebClient.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ipController = TextEditingController();  

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(WebClient.url),
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
                controller: _ipController,
                decoration: const InputDecoration(labelText: 'IP'),

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor coloque algum IP';
                  }
                  
                  return null;
                },
                
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    WebClient.url = _ipController.text;
                    Navigator.popAndPushNamed(context, 'home');
                  }


                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}