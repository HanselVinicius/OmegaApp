import 'package:flutter/material.dart';
import 'package:omega_app/Models/user.dart';
import 'package:omega_app/Providers/user_provider.dart';
import 'package:omega_app/utils/utils.dart';
import 'package:provider/provider.dart';
import '../Components/card_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    UserProvider userProvider = UserProvider();
    Future<List<User>> users = userProvider.fetch();
    // List<CardView> items = [const CardView(itemName: 'teste', itemHistory: 'teste', imageURI: 'teste')];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Omega'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                users = userProvider.fetch();
              });
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Consumer<UserProvider>(
        builder:(context, value, child) {
         return FutureBuilder<List<User>>(
            future: users,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<User> users = snapshot.data!;
                return ListView.builder(
                  controller: scrollController,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return CardView(user: snapshot.data![index]);
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            midiaPermision(context);
            Navigator.of(context).popAndPushNamed('form');
          },
          child: const Icon(Icons.add)),
    );
  }
}
