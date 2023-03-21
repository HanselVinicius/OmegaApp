import 'package:flutter/material.dart';
import 'package:omega_app/Providers/user_provider.dart';
import 'package:omega_app/Services/user_service.dart';
import 'package:provider/provider.dart';
import 'Screens/form_screen.dart';
import 'Screens/home_page.dart';

void main() {
  //
  // UserService userService = UserService();
  // print("pegou?: ${userService.getAll()}");
  runApp(ChangeNotifierProvider(
    create: (context) => UserProvider(),
    child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      initialRoute: 'home',
      routes: {
        'home':(context) => const HomePage(),
        'form':(context) =>  FormScreen()
      },
    );
  }
}

