import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omega_app/Providers/user_provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  FormScreenState createState() => FormScreenState();
}

class FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    // _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic pathController;
    UserProvider userProvider = UserProvider();

    Future<XFile> pickImage({required bool isCamera}) async {
      ImagePicker picker = ImagePicker();
      XFile? pickedFile = await picker.pickImage(
          source: (isCamera) ? ImageSource.camera : ImageSource.gallery);
      if (pickedFile != null) {
        return pickedFile;
      }
      throw Exception();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por Favor coloque o Nome';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () async {
                        final XFile imageFile =
                            await pickImage(isCamera: false);
                        if (imageFile != null) {
                          final pickedImage = await imageFile.readAsBytes();
                          if (pickedImage != null) {
                            pathController = pickedImage;
                          }
                        }
                      },
                      child: const Icon(Icons.image_outlined),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final XFile? imageFile = await pickImage(isCamera: true);
                      if (imageFile != null) {
                        final pickedImage = await imageFile.readAsBytes();
                        if (pickedImage != null) {
                          pathController = pickedImage;
                        }
                      }
                    },
                    child: const Icon(Icons.camera),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String name = _nameController.text;
                      String foto = base64Encode(pathController);
                      userProvider.userRegister(
                          userName: name, userPhoto: foto);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Salvando usuario'),
                        ),
                      );
                      Navigator.popAndPushNamed(context, 'home');
                    }
                  },
                  child: const Text('Adcionar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
