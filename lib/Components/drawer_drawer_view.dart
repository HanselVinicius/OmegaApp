import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children:  [
          const DrawerHeader(decoration: BoxDecoration(
            color: Colors.blue
          ), child: Text(''),),


          const ListTile(
            title: Text('Escolha a tela', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurar o IP',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal),),
            onTap: (){
              Navigator.pushNamed(context, 'config');
            },
          ),
        ],
      ),
    );
  }
}
