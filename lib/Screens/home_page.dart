import 'package:flutter/material.dart';
import 'package:omega_app/Components/drawer_drawer_view.dart';
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

class _HomePageState extends State<HomePage> with WidgetsBindingObserver{
  @override
  Widget build(BuildContext context) {


    // final ScrollController scrollController = ScrollController();
    UserProvider userProvider = UserProvider();
    Future<List<User>> users = userProvider.fetch();

    void rebuildHomePage() {
      setState(() {
        users = UserProvider().fetch();
      });
    }
    // List<CardView> items = [const CardView(itemName: 'teste', itemHistory: 'teste', imageURI: 'teste')];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Omega'),

      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            users = userProvider.fetch();
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8,bottom: 30),
             child: Consumer<UserProvider>(
               builder: (context, value, child) {

               return FutureBuilder<List<User>>(
                  future: users,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<User> users = snapshot.data!;
                      return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return CardView(user: snapshot.data![index],onDelete: (user) {
                          UserProvider().remove(user).then((value) {
                            rebuildHomePage();
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Deletando Usuário...'),),);
                          });

                          },);
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
        ),
      ),

    drawer: const LeftDrawer(),

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            midiaPermision(context);
            Navigator.of(context).pushNamed('form');
          },
          child: const Icon(Icons.add)),
    );
  }
}
