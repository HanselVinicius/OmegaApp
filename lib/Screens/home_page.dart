
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omega_app/utils/utils.dart';
import '../Components/card_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<CardView> items = [const CardView(itemName: 'teste', itemHistory: 'teste', imageURI: 'teste')];
    return  Scaffold(
      appBar: AppBar(title: const Text('Omega'),
      actions: <Widget>[
        IconButton(onPressed: (){}, icon: const Icon(Icons.settings,color: Colors.white,),)
      ],),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return items[index];
        },
      itemCount: items.length,
      ),
    floatingActionButton: FloatingActionButton(onPressed: () {
      midiaPermision(context);
      Navigator.of(context).popAndPushNamed('form');
    },child: const Icon(Icons.add)),
    );
  }
}
