
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  FormScreenState createState() => FormScreenState();
}

class FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _registroController = TextEditingController();
  String _pathController = '';
    
  @override
  void dispose() {
    _nameController.dispose();
    _registroController.dispose();
    // _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Future<String> pickImage({required bool isCamera}) async {
      ImagePicker picker = ImagePicker();
      XFile? pickedFile = await picker.pickImage(source: (isCamera) ? ImageSource.camera : ImageSource.gallery );
      if(pickedFile != null){
        return pickedFile.path;
      }
      return 'sem imagem';
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
                      borderSide: BorderSide(color: Colors.blue,width: 2.0)
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por Favor coloque o Nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _registroController,
                decoration: const InputDecoration(
                  labelText: 'Dia do Registro',
                  icon: Icon(Icons.access_time),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,width: 2.0)
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por Favor coloque o ultimo registro';
                  }
                  return null;
                },
              ),
               Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ElevatedButton(onPressed: () async{
                          final pickedImage = await pickImage(isCamera: false);
                          _pathController = pickedImage;
                        },
                          child: const Icon(Icons.image_outlined),
                        ),
                      ),
                      ElevatedButton(onPressed: () async{
                        final pickedImage = await pickImage(isCamera: true);
                        _pathController = pickedImage;

                      },
                        child: const Icon(Icons.camera),
                      ),
                    ]
                  ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // do something with the form data
                      String name = _nameController.text;
                      String registro = _registroController.text;
                      String foto = _pathController;

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